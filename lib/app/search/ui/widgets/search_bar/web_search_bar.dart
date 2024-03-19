import 'package:flutter/material.dart';
import 'package:teste_code_hero_mobile/app/search/ui/extensions/theme.dart';

class WebSearchBar extends StatelessWidget {
  final String initText;
  final Function(String textChanged) onChanged;
  const WebSearchBar(
      {super.key, required this.onChanged, required this.initText});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Nome do Personagem",
          style: theme.textTheme.searchBarLabel,
        ),
        SizedBox(
          width: 400,
          height: 31,
          child: TextFormField(
            initialValue: initText,
            onChanged: onChanged,
            decoration: const InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.all(8),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFA5A5A5))),
            ),
          ),
        ),
      ],
    );
  }
}
