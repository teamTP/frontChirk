import 'dart:math';

import 'package:flutter/cupertino.dart';

import '../../models/chirk.dart';
import '../../models/user.dart';

abstract class IChirkListService{
  ValueNotifier<List<Chirk>> getChirks();
}

class ChirkListServiceList implements IChirkListService{


  static List<Chirk> _initChirkList() {
    List<Chirk> chirkList = [];
    var rnd = Random();
    for (int i = 0; i < 10; i++) {
      var chirk = Chirk(
        id: i * 3,
        dateTime: DateTime.now(),
        text:
        "Ntcnjdsq ntrcn j njv xnj gbitn xtkjdtr lkz njuj xnj ,s dbltnm dtcm "
            "ntttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt"
            "tttttttttttttttttttttttttttttttttttttttt",
        user: User(
            id: i + 1,
            iconId: rnd.nextInt(6),
            name: "Петр",
            surname: "Николаевич",
            login: "petr@nicol.com",
            password: ":OHG:25L:JHG"),
        likeCount: i * 5,
        disLikeCount: i * 4,
      );
      chirkList.add(chirk);
    }
    return chirkList;
  }

  static User _initUser() {
    return User(
        id: 1,
        iconId: 1,
        name: "Иван",
        surname: "Сидоров",
        login: "ivan@sidorov.ru",
        password: ":OHG:25L:JHG");
  }

  @override
  ValueNotifier<List<Chirk>> getChirks() {
    return ValueNotifier(_initChirkList());
  }
}
