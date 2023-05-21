import 'package:chirk/model/chirk_list_model.dart';
import 'package:chirk/model/signUp/login_model.dart';
import 'package:chirk/provider/user_provider.dart';
import 'package:chirk/widget/chirk_widget/chirk_list_widget.dart';
import 'package:chirk/widget/login/signup_widget.dart';
import 'package:chirk/widget/profile/edit_profile_widget.dart';
import 'package:chirk/widget/home_widget.dart';
import 'package:chirk/widget/login/login_widget.dart';
import 'package:chirk/theme/theme.dart';
import 'package:chirk/widget/onboarding/onbarding_widget.dart';
import 'package:chirk/widgetModel/chirk_list_wm.dart';
import 'package:chirk/widgetModel/signUp/login_wm.dart';
import 'package:chirk/widgetModel/signUp/signup_wm.dart';
import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'model/signUp/signup_model.dart';

void main() {
  runApp( MultiProvider(
    providers: [
      ChangeNotifierProvider<UserProvider>(create: (_) => UserProvider()),
    ],
    child:   EasyDynamicThemeWidget(
    child: const ChirkApp(),
  )));
}

class ChirkApp extends StatefulWidget {
  const ChirkApp({super.key});

  @override
  State<StatefulWidget> createState() => _ChirkAppState();
}

class _ChirkAppState extends State<ChirkApp> {
  ColorTheme colorThem = ColorTheme(Colors.yellow);
  HomeWidget homeWidget =  HomeWidget();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(


    theme: colorThem.getLightMatDisign(),
      darkTheme: colorThem.getDarkMatDisign(),
      themeMode: EasyDynamicTheme.of(context).themeMode,
      initialRoute: '/register',
      routes: {
        '/onBoarding': (context) => const OnBoardingWidget(),
        '/': (context) => const HomeWidget(),
        '/login': (context) => LoginWidget((context) => LoginWM(LoginModel())),
        '/register': (context) => SignUpWidget((context) => SignUpWM(SignUpModel())),
        '/edit': (context) => const EditProfileWidget(),
        '/myChirk': (context) => ChirkListWidget(
            "Мои чирки",
            (context) => ChirkListWM(
                ChirkListModelDIO(ChirkListType.myList))),
        '/likedChirk': (context) => ChirkListWidget(
            "Понравившиеся чирки",
            (context) => ChirkListWM(
                ChirkListModelDIO(ChirkListType.liked))),
        '/dislikedChirk': (context) => ChirkListWidget(
            "Не понравившиеся чирки",
            (context) => ChirkListWM(
                ChirkListModelDIO(ChirkListType.disliked))),
      },
    );
  }
}
