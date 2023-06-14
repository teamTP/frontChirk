import 'dart:async';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashWidget extends StatefulWidget {
  const SplashWidget({super.key});

  @override
  State<StatefulWidget> createState() => _SplashWidgetState();
}

class _SplashWidgetState extends State<SplashWidget> {
  final bool _isFirstImageVisible = true;
  final FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      checkFirstSeen().then((value) => {
            if (value)
              {
                Navigator.pushNamedAndRemoveUntil(context, '/onBoarding', (route) => false),
              }
            else
              {
                Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false)
              }
          });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Brightness brightness = Theme.of(context).brightness;
    String underLogo =
        'assets/img/text-underlogo${brightness == Brightness.dark ? '-dark' : ''}.png';
    String logoSplash =
        'assets/img/logo-splash${brightness == Brightness.dark ? '-dark' : ''}.png';
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
                    Image.asset(
                      logoSplash,
                      width: 128,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Image.asset(
                      underLogo,
                      width: 128,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<bool> checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isFirstSeen = (prefs.getBool('firstSeen') ?? true);
    return isFirstSeen;
  }
}
