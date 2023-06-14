import 'package:appmetrica_plugin/appmetrica_plugin.dart';
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
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:chirk/model/login/sign_up_model.dart';
import 'package:flutter/services.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options:DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(EasyDynamicThemeWidget(
        child: MultiProvider(
      providers: [
        ChangeNotifierProvider<TokenProvider>(create: (_) => TokenProvider()),
      ],
      child: const ChirkApp(),
    )));
    AppMetrica.activate(const AppMetricaConfig("daf40c42-61ed-4ce0-ab6b-f811bd11dfef"));
  });


}

class ChirkApp extends StatefulWidget {
  const ChirkApp({super.key});

  @override
  State<StatefulWidget> createState() => _ChirkAppState();
}

class _ChirkAppState extends State<ChirkApp> {
  MaterialColor colorTheme = Colors.yellow;
  HomeWidget homeWidget = const HomeWidget();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ColorTheme(colorTheme).getLightMatTheme(),
      darkTheme: ColorTheme(colorTheme).getDarkMatTheme(),
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


  Future<void> fetchAndApplyConfig() async {

    final remoteConfig = FirebaseRemoteConfig.instance;

    try {
      // Время ожидания для получения конфигурации (необязательно)
      final fetchTimeout = Duration(seconds: 10);

      // Задайте значение по умолчанию для каждого параметра конфигурации
      final defaults = <String, dynamic>{
        'theme_color': 'yellow',
      };

      await remoteConfig.setConfigSettings(RemoteConfigSettings(
        fetchTimeout: const Duration(seconds: 10),
        minimumFetchInterval: const Duration(seconds: 50),
      ));
      await remoteConfig.setDefaults(defaults);

      // Загрузите значения конфигурации с сервера Firebase
      await remoteConfig.fetchAndActivate();

      // Получите значение для смены темы и примените его в вашем приложении
      final parseColorStr = remoteConfig.getString('theme_color');
      final parsedColor = _getColorFromPalette(parseColorStr);
      if(parsedColor != null){
        setState(() {
          colorTheme = parsedColor;
        });
      }
      // Примените значение themeColor для изменения темы в вашем приложении

    } catch (e) {
      // Обработка ошибок
      print('Error fetching remote config: $e');
    }
  }

  MaterialColor? _getColorFromPalette(String colorName) {
    colorName = colorName.toLowerCase();
    switch (colorName) {
    // Основные цвета
      case 'red':
        return Colors.red;
      case 'blue':
        return Colors.blue;
      case 'green':
        return Colors.green;
      case 'yellow':
        return Colors.yellow;
      case 'orange':
        return Colors.orange;
      case 'purple':
        return Colors.purple;
      case 'pink':
        return Colors.pink;
      case 'cyan':
        return Colors.cyan;

    // Цвета материала
      case 'indigo':
        return Colors.indigo;
      case 'teal':
        return Colors.teal;
      case 'lime':
        return Colors.lime;
      case 'amber':
        return Colors.amber;
      case 'deepOrange':
        return Colors.deepOrange;
      case 'brown':
        return Colors.brown;
      case 'blueGrey':
        return Colors.blueGrey;

      default:
        return null;
    }
  }

  @override
  void initState() {
    super.initState();
    fetchAndApplyConfig();
    AppMetrica.reportEvent("open_app");
  }
}
