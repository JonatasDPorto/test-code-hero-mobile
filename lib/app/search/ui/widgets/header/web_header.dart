import 'package:flutter/material.dart';
import 'package:teste_code_hero_mobile/app/search/ui/extensions/theme.dart';

class WebHeader extends StatelessWidget {
  const WebHeader({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RichText(
                text: TextSpan(
              text: 'BUSCA MARVEL',
              style: theme.textTheme.titleWebBold,
              children: [
                TextSpan(
                  text: 'TESTE FRONT-END',
                  style: theme.textTheme.titleWebLight,
                ),
              ],
            )),
            Text(
              'JÔNATAS DOURADO PORTO',
              style: theme.textTheme.titleWebLight,
            )
          ],
        ),
        Container(
          width: 54,
          height: 4,
          color: theme.textTheme.mainColor,
        )
      ],
    );
  }
}
