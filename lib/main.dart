import 'package:chirk/widget/edit_profile_widget.dart';
import 'package:chirk/widget/home_widget.dart';
import 'package:chirk/widget/login_widget.dart';
import 'package:chirk/theme/theme.dart';
import 'package:chirk/widget/register_widget.dart';
import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(EasyDynamicThemeWidget(
      child: ChirkApp(),
  )
  );
}

class ChirkApp extends StatefulWidget {
  const ChirkApp({super.key});

  @override
  State<StatefulWidget> createState() => _ChirkAppState();
}

class _ChirkAppState extends State<ChirkApp> {
  ColorTheme colorThem = ColorTheme(Colors.yellow);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: colorThem.getLightMatDisign(),
      darkTheme: colorThem.getDarkMatDisign(),
      themeMode: EasyDynamicTheme.of(context).themeMode,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeWidget(),
        '/login': (context) => LoginWidget(),
        '/edit' : (context) => EditProfileWidget(),
        'reguster': (context) => RegisterPage(),
      },
    );
  }
}
