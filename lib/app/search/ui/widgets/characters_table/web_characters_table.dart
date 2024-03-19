import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:teste_code_hero_mobile/app/search/domain/entities/character.dart';
import 'package:teste_code_hero_mobile/app/search/ui/extensions/theme.dart';
import 'package:teste_code_hero_mobile/app/search/ui/widgets/characters_table/character_table_item.dart';
import 'package:teste_code_hero_mobile/app/search/ui/widgets/characters_table/table_pager.dart';
import 'package:teste_code_hero_mobile/app/search/ui/widgets/characters_table/text_table_item.dart';

class WebCharactersTable extends StatelessWidget {
  final List<Character> characters;
  final int numberPages;
  final int pageSelected;
  final void Function(int page) goToPage;

  const WebCharactersTable(
      {super.key,
      required this.characters,
      required this.numberPages,
      required this.pageSelected,
      required this.goToPage});

  TableRow _getHeader(ThemeData theme) {
    return TableRow(
      children: [
        Container(
          height: 37,
          color: theme.textTheme.mainColor,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              'Personagem',
              style: theme.textTheme.tableHeader,
            ),
          ),
        ),
        const SizedBox(),
        Container(
          height: 37,
          color: theme.textTheme.mainColor,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              'Séries',
              style: theme.textTheme.tableHeader,
            ),
          ),
        ),
        const SizedBox(),
        Container(
          height: 37,
          color: theme.textTheme.mainColor,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              'Eventos',
              style: theme.textTheme.tableHeader,
            ),
          ),
        ),
      ],
    );
  }

  List<TableRow> _getData(ThemeData theme) {
    return characters
        .map(
          (character) => TableRow(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: const Color(0xFFD42026).withOpacity(.20),
                  width: 2.0,
                ),
              ),
            ),
            children: [
              TableRowInkWell(
                overlayColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                    if (states.contains(MaterialState.hovered)) {
                      return const Color(0xFFD42026).withOpacity(.10);
                    }
                    return Colors.transparent;
                  },
                ),
                onTap: () {},
                child: SizedBox(
                  height: 112,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: CharacterTableItem(character: character),
                  ),
                ),
              ),
              const SizedBox(),
              TableRowInkWell(
                overlayColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                    if (states.contains(MaterialState.hovered)) {
                      return const Color(0xFFD42026).withOpacity(.10);
                    }
                    return Colors.transparent;
                  },
                ),
                onTap: () {},
                child: TextTableItem(
                  text: character.series.join('\n'),
                ),
              ),
              const SizedBox(),
              TableRowInkWell(
                overlayColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                    if (states.contains(MaterialState.hovered)) {
                      return const Color(0xFFD42026).withOpacity(.10);
                    }
                    return Colors.transparent;
                  },
                ),
                onTap: () {},
                child: TextTableItem(
                  text: character.events.join('\n'),
                ),
              ),
            ],
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Column(
      children: [
        Table(
          columnWidths: const {
            0: FlexColumnWidth(0.25),
            1: FixedColumnWidth(10),
            2: FlexColumnWidth(0.25),
            3: FixedColumnWidth(10),
            4: FlexColumnWidth(0.75),
          },
          children: [
            _getHeader(theme),
            ..._getData(theme),
          ],
        ),
        Expanded(
          child: Center(
            child: TablePager(
              arrowsMargin: 12,
              numberPages: numberPages,
              pageSelected: pageSelected,
              goToPage: goToPage,
              maxNumberPages: 5,
              centerPageNumber: 2,
            ),
          ),
        ),
      ],
    );
  }
}
