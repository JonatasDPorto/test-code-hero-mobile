import 'package:flutter/material.dart';

extension CustomTextStyles on TextTheme {
  Color get mainColor => const Color(0xFFD42026);

  TextStyle get titleWebBold {
    return const TextStyle(
      fontSize: 27.0,
      color: Color(0xFFD42026),
      fontFamily: 'Roboto-Black',
      letterSpacing: 0,
      height: 1.2,
    );
  }

  TextStyle get titleWebLight {
    return const TextStyle(
      fontSize: 27.0,
      color: Color(0xFFD42026),
      fontFamily: 'Roboto-Light',
      letterSpacing: 0,
      height: 1.2,
    );
  }

  TextStyle get titleMobileBold {
    return const TextStyle(
      fontSize: 16.0,
      color: Color(0xFFD42026),
      fontFamily: 'Roboto-Black',
      letterSpacing: 0,
      height: 1.2,
    );
  }

  TextStyle get titleMobileLight {
    return const TextStyle(
      fontSize: 16.0,
      color: Color(0xFFD42026),
      fontFamily: 'Roboto-Light',
      letterSpacing: 0,
      height: 1.2,
    );
  }

  TextStyle get searchBarLabel {
    return const TextStyle(
      fontSize: 16.0,
      color: Color(0xFFD42026),
      fontFamily: 'Roboto-Regular',
      letterSpacing: 0,
      height: 1.2,
    );
  }

  TextStyle get tableHeader {
    return const TextStyle(
      fontSize: 16.0,
      color: Color(0xFFFFFFFF),
      fontFamily: 'Roboto-Regular',
      letterSpacing: 0,
      height: 1.2,
    );
  }

  TextStyle get tableText {
    return const TextStyle(
      fontSize: 21.0,
      color: Color(0xFF4E4E4E),
      fontFamily: 'Roboto-Regular',
      letterSpacing: 0,
      height: 1.1,
    );
  }

  TextStyle get pagerSelectedText {
    return const TextStyle(
      fontSize: 21.0,
      color: Color(0xFFFFFFFF),
      fontFamily: 'Roboto-Regular',
      letterSpacing: 0,
      height: 1.1,
    );
  }

  TextStyle get pagerUnselectedText {
    return const TextStyle(
      fontSize: 21.0,
      color: Color(0xFFD42026),
      fontFamily: 'Roboto-Regular',
      letterSpacing: 0,
      height: 1.1,
    );
  }
}
