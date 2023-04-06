import 'package:chirk/pages/homePage.dart';
import 'package:chirk/theme/theme.dart';
import 'package:flutter/material.dart';

void main(){
  ColorThem colorThem = ColorThem(Colors.blue);
  runApp(MaterialApp(
      theme: colorThem.getLightTheme(),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
      },
    ));
    }
