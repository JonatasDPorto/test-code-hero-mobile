import 'package:flutter/material.dart';
import 'package:teste_code_hero_mobile/app/search/domain/entities/character.dart';
import 'package:teste_code_hero_mobile/app/search/ui/extensions/theme.dart';

class CharacterTableItem extends StatelessWidget {
  final Character character;
  const CharacterTableItem({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Row(
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
        const SizedBox(width: 25),
        Flexible(
          child: Text(
            character.name,
            style: theme.textTheme.tableText,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
        )
      ],
    );
  }
}
