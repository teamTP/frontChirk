import 'dart:math';

import 'package:flutter/material.dart';

import '../entity/chirk.dart';
import '../entity/user.dart';

abstract class IChirkListService {
  List<Chirk> get chirks;

  void pagination();

  void update();
}
