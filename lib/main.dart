import 'package:chirk/widget/profile/edit_profile_widget.dart';
import 'package:chirk/widget/home_widget.dart';
import 'package:chirk/widget/login/login_widget.dart';
import 'package:chirk/theme/theme.dart';
import 'package:chirk/widget/onboarding/onbarding_widget.dart';
import 'package:chirk/widget/login/register_widget.dart';
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
      initialRoute: '/onBoarding',
      routes: {
        '/onBoarding': (context) => OnBoardingWidget(),
        '/': (context) => const HomeWidget(),
        '/login': (context) => LoginWidget(),
        '/register': (context) => RegisterWidget(),
        '/edit' : (context) => EditProfileWidget(),
      },
    );
  }
}
