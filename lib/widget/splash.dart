import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<StatefulWidget> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  late Timer _timer;
  bool _isFirstImageVisible = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      checkFirstSeen();
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final Brightness brightness = Theme.of(context).brightness;
    String underLogo = 'assets/img/text-underlogo${brightness==Brightness.dark?'-dark':''}.png';
    String logoSplash = 'assets/img/logo-splash${brightness==Brightness.dark?'-dark':''}.png';
    return Scaffold(
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedOpacity(
              opacity: _isFirstImageVisible ? 1.0 : 0.0,
              duration: const Duration(seconds: 1),
              child: Align(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(logoSplash, width: 128,),
                    SizedBox(height: 24,),
                    Image.asset(underLogo, width: 128,),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isFirstSeen = (prefs.getBool('firstSeen') ?? true);

    if (isFirstSeen) {
      Navigator.pushNamedAndRemoveUntil(context, '/onBoarding', (route) => false);
    } else {
      Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
    }
  }
}
