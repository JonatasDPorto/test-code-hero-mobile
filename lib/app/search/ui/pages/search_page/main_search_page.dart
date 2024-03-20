import 'package:flutter/material.dart';
import 'package:teste_code_hero_mobile/app/search/ui/extensions/theme.dart';
import 'package:teste_code_hero_mobile/app/search/ui/pages/search_page/web_search_page.dart';
import 'package:teste_code_hero_mobile/app/search/ui/pages/search_page/mobile_search_page.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

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
                  return const MobileSearchPage();
                }
                return const WebSearchPage();
              },
            ),
          ),
          Container(height: 12, color: theme.textTheme.mainColor),
        ],
      ),
    );
  }
}
