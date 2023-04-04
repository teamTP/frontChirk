import 'package:chirk/pages/homePage.dart';
import 'package:chirk/theme/theme.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      theme: lightYellowTheme(),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
      },
    ));
