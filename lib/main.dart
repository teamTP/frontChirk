import 'package:chirk/model/chirk/chirk_list_model.dart';
import 'package:chirk/model/login/log_in_model.dart';
import 'package:chirk/service/config.dart';
import 'package:chirk/service/provider/user_provider.dart';
import 'package:chirk/service/theme/theme.dart';
import 'package:chirk/widget/chirk/chirk_list_widget.dart';
import 'package:chirk/widget/login/signup_widget.dart';
import 'package:chirk/widget/home_widget.dart';
import 'package:chirk/widget/login/login_widget.dart';
import 'package:chirk/widget/onBoarding/onBoarding_widget.dart';
import 'package:chirk/widget/splash.dart';
import 'package:chirk/widgetModel/chirk/chirk_list_wm.dart';
import 'package:chirk/widgetModel/login/login_wm.dart';
import 'package:chirk/widgetModel/login/signup_wm.dart';
import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:chirk/model/login/sign_up_model.dart';
import 'package:flutter/services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(EasyDynamicThemeWidget(
        child: MultiProvider(
      providers: [
        ChangeNotifierProvider<TokenProvider>(create: (_) => TokenProvider()),
      ],
      child: const ChirkApp(),
    )));
  });
}

class ChirkApp extends StatefulWidget {
  const ChirkApp({super.key});

  @override
  State<StatefulWidget> createState() => _ChirkAppState();
}

class _ChirkAppState extends State<ChirkApp> {
  ColorTheme colorThem = ColorTheme(Colors.yellow);
  HomeWidget homeWidget = const HomeWidget();
  final FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorObservers: [
        FirebaseAnalyticsObserver(analytics: analytics),
      ],
      debugShowCheckedModeBanner: false,
      theme: colorThem.getLightMatTheme(),
      darkTheme: colorThem.getDarkMatTheme(),
      themeMode: EasyDynamicTheme.of(context).themeMode,
      initialRoute: '/splash',
      routes: {
        '/onBoarding': (context) => const OnBoardingWidget(),
        '/splash': (context) => const SplashWidget(),
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
