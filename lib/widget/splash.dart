import 'dart:async';

import 'package:flutter/material.dart';

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
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      setState(() {
        _isFirstImageVisible = !_isFirstImageVisible;
      });
    });
    Timer(const Duration(seconds: 2), () {
      _timer.cancel();
      Navigator.pushReplacementNamed(context, '/onBoarding');
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
                    Image.asset('assets/img/logo-splash.png'),
                    Image.asset('assets/img/text-underlogo.png'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
