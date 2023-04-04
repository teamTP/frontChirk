import 'package:chirk/activities/test.dart';
import 'package:chirk/theme/theme.dart';
import 'package:flutter/material.dart';

import 'activities/home.dart';

void main() => runApp(MaterialApp(
  theme: createLightYellowTheme(),
  initialRoute: '/',
  routes: {
    //'/': (context) => Splash(),
    '/': (context) => TestActivity(),
  },
));