import 'package:flutter/material.dart';
import 'package:teste_code_hero_mobile/app/search/domain/entities/character.dart';
import 'package:teste_code_hero_mobile/app/search/ui/extensions/theme.dart';
import 'package:teste_code_hero_mobile/app/search/ui/widgets/header/web_header.dart';

class WebDisplayCharacterPage extends StatelessWidget {
  final Character character;
  const WebDisplayCharacterPage({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 42, right: 42, top: 20),
          child: Column(
            children: [
              const WebHeader(),
              const SizedBox(height: 24),
              Row(
                children: [
                  ClipOval(
                    child: Image.network(
                      character.image,
                      width: 58,
                      height: 58,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          width: 58,
                          height: 58,
                          color: theme.textTheme.mainColor.withOpacity(.2),
                        );
                      },
                    ),
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        character.name,
                        style: theme.textTheme.tableText,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(42.0),
                child: Container(
                  height: 37,
                  color: theme.textTheme.mainColor,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 8, left: 30),
                    child: Text(
                      'Descrição',
                      style: theme.textTheme.tableHeader,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 82.0),
          child: Text(
            character.description,
            style: theme.textTheme.tableText,
          ),
        ),
      ],
    );
  }
}
