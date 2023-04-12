import 'package:chirk/pages/homePage.dart';
import 'package:chirk/pages/loginPage.dart';
import 'package:chirk/theme/theme.dart';
import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(EasyDynamicThemeWidget(
      child: ChirkApp(),
  )
  );
}

class ChirkApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ChirkAppState();
}

class _ChirkAppState extends State<ChirkApp> {
  ColorTheme colorThem = ColorTheme(Colors.yellow);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: colorThem.getLightTheme(),
      darkTheme: colorThem.getDarkTheme(),
      themeMode: EasyDynamicTheme.of(context).themeMode,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/login': (context) => LoginPage(),
      },
    );
  }
}
