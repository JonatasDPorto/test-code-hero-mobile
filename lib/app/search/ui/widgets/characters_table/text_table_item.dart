import 'package:flutter/material.dart';
import 'package:teste_code_hero_mobile/app/search/ui/extensions/theme.dart';

class TextTableItem extends StatelessWidget {
  final String text;
  const TextTableItem({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Text(
        text,
        style: theme.textTheme.tableText,
        overflow: TextOverflow
            .ellipsis, // This will fade out the text if it overflows
        maxLines:
            3, // Optionally, you can set maxLines to limit the number of lines
      ),
    );
  }
}
