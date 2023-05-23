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
                    Image.asset('assets/img/logo-splash.png', width: 128,),
                    SizedBox(height: 24,),
                    Image.asset('assets/img/text-underlogo.png', width: 128,),
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
      await prefs.setBool('firstSeen', false);
      Navigator.pushReplacementNamed(context, '/onboarding');
    } else {
      Navigator.pushReplacementNamed(context, '/');
    }
  }
}
