import 'package:flutter/material.dart';

ThemeData createLightYellowTheme(){
  return ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.yellow,
    scaffoldBackgroundColor: Colors.yellow[50],
    bottomAppBarTheme: const BottomAppBarTheme(
      color: Colors.black,
    ),
    canvasColor: Colors.yellow[50],
  iconTheme: IconThemeData(

  )
  );

}
