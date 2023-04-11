import 'package:chirk/pages/homePage.dart';
import 'package:chirk/pages/loginPage.dart';
import 'package:chirk/theme/theme.dart';
import 'package:flutter/material.dart';

void main(){
  ColorTheme colorThem = ColorTheme(Colors.yellow);



  runApp(MaterialApp(
      theme: colorThem.getLightTheme(),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/login': (context) => LoginPage(),
      },
    ));
    }
