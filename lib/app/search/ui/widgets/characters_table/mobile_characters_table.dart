import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:teste_code_hero_mobile/app/search/domain/entities/character.dart';
import 'package:teste_code_hero_mobile/app/search/ui/extensions/theme.dart';
import 'package:teste_code_hero_mobile/app/search/ui/widgets/characters_table/character_table_item.dart';
import 'package:teste_code_hero_mobile/app/search/ui/widgets/characters_table/table_pager.dart';

class MobileCharactersTable extends StatelessWidget {
  final List<Character> characters;
  final int numberPages;
  final int pageSelected;
  final void Function(int page) goToPage;
  final void Function(Character character) onTapCharacter;
  const MobileCharactersTable(
      {super.key,
      required this.characters,
      required this.numberPages,
      required this.pageSelected,
      required this.goToPage,
      required this.onTapCharacter});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Container(
                height: 37,
                color: theme.textTheme.mainColor,
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 8, bottom: 8, left: 30 + 58 + 12),
                  child: Text(
                    'Nome',
                    style: theme.textTheme.tableHeader,
                  ),
                ),
              ),
            ),
          ],
        ),
        ListView.builder(
          shrinkWrap: true,
          itemCount: characters.length,
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) {
            var character = characters[index];
            return Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Color(0xFFD42026),
                    width: 1.0,
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: GestureDetector(
                  onTap: () {
                    onTapCharacter(character);
                  },
                  child: CharacterTableItem(character: character),
                ),
              ),
            );
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 18),
          child: TablePager(
            arrowsMargin: 60,
            numberPages: numberPages,
            pageSelected: pageSelected,
            goToPage: goToPage,
            maxNumberPages: 3,
            centerPageNumber: 1,
          ),
        ),
      ],
    );
  }
}
