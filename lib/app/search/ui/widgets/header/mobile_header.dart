import 'package:flutter/material.dart';
import 'package:teste_code_hero_mobile/app/search/ui/extensions/theme.dart';

class MobileHeader extends StatelessWidget {
  const MobileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            RichText(
                text: TextSpan(
              text: 'BUSCA MARVEL',
              style: theme.textTheme.titleMobileBold,
              children: [
                TextSpan(
                  text: 'TESTE FRONT-END',
                  style: theme.textTheme.titleMobileLight,
                ),
              ],
            )),
          ],
        ),
        Container(
          width: 54,
          height: 2,
          color: theme.textTheme.mainColor,
        )
      ],
    );
  }
}
