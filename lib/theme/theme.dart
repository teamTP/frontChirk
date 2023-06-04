import 'package:flutter/material.dart';

class ColorTheme {
  final MaterialColor _primaryColor;

  ColorTheme(this._primaryColor);

  ThemeData getLightMatTheme() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _primaryColor,
      fontFamily: 'VKSans',
    );
  }

  ThemeData getDarkMatTheme() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _primaryColor,
      brightness: Brightness.dark,
      fontFamily: 'VKSans',
    );
  }
}
