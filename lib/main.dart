import 'package:chirk/model/chirk/chirk_list_model.dart';
import 'package:chirk/model/login/login_model.dart';
import 'package:chirk/provider/user_provider.dart';
import 'package:chirk/service/config.dart';
import 'package:chirk/widget/chirk/chirk_list_widget.dart';
import 'package:chirk/widget/login/signup_widget.dart';
import 'package:chirk/widget/home_widget.dart';
import 'package:chirk/widget/login/login_widget.dart';
import 'package:chirk/theme/theme.dart';
import 'package:chirk/widget/onboarding/onbarding_widget.dart';
import 'package:chirk/widget/splash.dart';
import 'package:chirk/widgetModel/chirk/chirk_list_wm.dart';
import 'package:chirk/widgetModel/login/login_wm.dart';
import 'package:chirk/widgetModel/login/signup_wm.dart';
import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:chirk/model/login/signup_model.dart';
import 'package:flutter/services.dart';

import 'widget/profile/edit_profile_widget.dart';
import 'entity/user.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
    .then((_) {
  runApp(EasyDynamicThemeWidget(
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider<UserProvider>(create: (_) => UserProvider()),
          ChangeNotifierProvider<TokenProvider>(create: (_) => TokenProvider()),
        ],
        child: const ChirkApp(),
      )));
});

}

class ChirkApp extends StatefulWidget{
  const ChirkApp({super.key});

  @override
  State<StatefulWidget> createState() => _ChirkAppState();
}

class _ChirkAppState extends State<ChirkApp> {
  ColorTheme colorThem = ColorTheme(Colors.yellow);
  HomeWidget homeWidget = const HomeWidget();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: colorThem.getLightMatTheme(),
      darkTheme: colorThem.getDarkMatTheme(),
      themeMode: EasyDynamicTheme.of(context).themeMode,

      initialRoute: '/splash',
      routes: {
        '/onBoarding': (context) => const OnBoardingWidget(),
        '/splash': (context) =>  const Splash(),
        '/': (context) => const HomeWidget(),
        '/login': (context) => LoginWidget((context) => LoginWM(LoginModel())),
        '/register': (context) =>
            SignUpWidget((context) => SignUpWM(SignUpModel())),
        '/myChirk': (context) => ChirkListWidget("Мои чирки",
            (context) => ChirkListWM(ChirkListModelDIO(ChirkListType.myList))),
        '/likedChirk': (context) => ChirkListWidget("Понравившиеся чирки",
            (context) => ChirkListWM(ChirkListModelDIO(ChirkListType.liked))),
        '/dislikedChirk': (context) => ChirkListWidget(
            "Не понравившиеся чирки",
            (context) =>
                ChirkListWM(ChirkListModelDIO(ChirkListType.disliked))),
      },
    );
  }
}
