import 'dart:math';

import 'package:flutter/cupertino.dart';

import '../../entity/chirk.dart';
import '../../entity/user.dart';
import '../chirl_list_service.dart';

abstract class IChirkListServiceList implements IChirkListService {
  List<Chirk> chirkList=[];
  @protected
  List<Chirk> initChirkList();
  @override void pagination() {
    chirkList.addAll(initChirkList());
  }
  @override
  void update() {
    chirkList = initChirkList();
  }
}
