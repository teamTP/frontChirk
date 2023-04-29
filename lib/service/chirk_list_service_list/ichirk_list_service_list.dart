import 'dart:math';

import 'package:flutter/cupertino.dart';

import '../../entity/chirk.dart';
import '../../entity/user.dart';
import '../chirl_list_service.dart';

abstract class IChirkListServiceList implements IChirkListService {
  @protected
  List<Chirk> initChirkList();
}
