import 'package:chirk/pages/homePage.dart';
import 'package:chirk/pages/loginPage.dart';
import 'package:chirk/theme/theme.dart';
import 'package:flutter/material.dart';

void main(){
  ColorTheme colorThem = ColorTheme(Colors.yellow);



  runApp(MaterialApp(
      theme: colorThem.getLightTheme(),
      darkTheme: colorThem.getDarkTheme(),
      themeMode: ThemeMode.light,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/login': (context) => LoginPage(),
      },
    ));
    }
