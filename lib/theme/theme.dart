import 'package:flutter/material.dart';

class ColorTheme {
  static const Color onSurfaceMedium = Color.fromRGBO(0, 0, 0, 0.6);
  static const Color onSurfaceDisabled = Color.fromRGBO(0, 0, 0, 0.38);
  static const Color onSurfaceHigh = Color.fromRGBO(0, 0, 0, 0.87);

  static const Color onPrimaryHigh = Color.fromRGBO(255, 255, 255, 1);
  static const Color onPrimaryMedium = Color.fromRGBO(255, 255, 255, 0.74);
  static const Color onPrimaryDisabled = Color.fromRGBO(255, 255, 255, 0.38);

  final MaterialColor _primaryColor;

  ColorTheme(this._primaryColor);

  ThemeData getLightTheme() {
    return ThemeData(
        primarySwatch: _primaryColor,
        scaffoldBackgroundColor: _primaryColor[50],
        bottomAppBarTheme: const BottomAppBarTheme(
          color: onSurfaceMedium,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: onSurfaceHigh,
          unselectedItemColor: onSurfaceMedium,
        ),
        canvasColor: _primaryColor[500],
        iconTheme: const IconThemeData());
  }

  ThemeData getDarkTheme() {
    return ThemeData(
      brightness: Brightness.dark,
      primarySwatch: _primaryColor,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: _primaryColor,
      ),
    );
  }
}
