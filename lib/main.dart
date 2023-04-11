import 'package:chirk/pages/homePage.dart';
import 'package:chirk/theme/theme.dart';
import 'package:flutter/material.dart';

void main(){
  ColorTheme colorThem = ColorTheme(Colors.yellow);



  runApp(MaterialApp(
      theme: colorThem.getLightTheme(),
      darkTheme: colorThem.getDarkTheme(),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
      },
    ));
    }
