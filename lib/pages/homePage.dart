import 'dart:math';

import 'package:chirk/templates/abstractPage.dart';
import 'package:chirk/templates/abstractStandartState.dart';
import 'package:chirk/models/chirkMessage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../templates/cardListChirk.dart';

class HomePage extends AbstractPage {
  HomePage() : super('Тест');

  @override
  State<StatefulWidget> createState() => _homeState(title);
}

class _homeState extends AbstractNavigationState {
  _homeState(super.title);

  @override
  Widget createBody() {
    return CardList.addCardList(context, initChirkList());
  }

  List<Chirk> initChirkList() {
    List<Chirk> chirkList = [];
    var rnd = Random();
    for (int i = 0; i < 10; i++) {
      var chrk = Chirk(
          i * 3,
          DateTime.now(),
          "Ntcnjdsq ntrcn j njv xnj gbitn xtkjdtr lkz njuj xnj ,s dbltnm dtcm "
              "ntttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt"
              "tttttttttttttttttttttttttttttttttttttttt",
          i + 1,
          rnd.nextInt(6),
          "Петр",
          "Николаевич",
          true);
      chirkList.add(chrk);
    }
    return chirkList;
  }
}
