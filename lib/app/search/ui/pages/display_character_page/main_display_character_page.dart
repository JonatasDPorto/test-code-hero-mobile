import 'package:flutter/material.dart';
import 'package:teste_code_hero_mobile/app/search/domain/entities/character.dart';
import 'package:teste_code_hero_mobile/app/search/ui/extensions/theme.dart';
import 'package:teste_code_hero_mobile/app/search/ui/pages/display_character_page/mobile_display_character_page.dart';
import 'package:teste_code_hero_mobile/app/search/ui/pages/display_character_page/web_display_character_page.dart';

class DisplayCharacterPage extends StatelessWidget {
  final Character character;
  const DisplayCharacterPage({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                var isMobile = constraints.maxWidth < 900;
                if (isMobile) {
                  return MobileDisplayCharacterPage(character: character);
                }
                return WebDisplayCharacterPage(character: character);
              },
            ),
          ),
          Container(height: 12, color: theme.textTheme.mainColor),
        ],
      ),
    );
  }
}
