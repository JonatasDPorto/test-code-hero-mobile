import 'package:flutter/material.dart';
import 'package:teste_code_hero_mobile/app/search/ui/extensions/theme.dart';
import 'package:teste_code_hero_mobile/app/search/ui/pages/web_page.dart';
import 'package:teste_code_hero_mobile/app/search/ui/pages/mobile_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

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
                  return const MobilePage();
                }
                return const WebPage();
              },
            ),
          ),
          Container(height: 12, color: theme.textTheme.mainColor),
        ],
      ),
    );
  }
}
