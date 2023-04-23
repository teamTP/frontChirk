import 'dart:math';

import 'package:flutter/cupertino.dart';

import '../../models/chirk.dart';
import '../../models/user.dart';

abstract class IChirkListService{
  List<Chirk> getChirks();
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
        "Проверочный текст, о том как мы пишем чирк все хочяень понятно и все такое там жили были дед да баба. Проверочный текст, о том как мы пишем чирк все хочяень понятно и все такое там жили были дед да баба. Проверочный текст, о том как мы пишем чирк все хочяень понятно и все так.",
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
  List<Chirk> getChirks() {
    return _initChirkList();
  }
}

class MyChirkListServiceList implements IChirkListService{
  int user_id;

  MyChirkListServiceList(this.user_id);

  @override
  List<Chirk> getChirks() {
    return _initChirkList(user_id);
  }

  static List<Chirk> _initChirkList(int userId) {
    List<Chirk> chirkList = [];
    var rnd = Random();
    for (int i = 0; i < 10; i++) {
      var chirk = Chirk(
        id: i * 3,
        dateTime: DateTime.now(),
        text:
        "Проверочный текст, о том как мы пишем чирк все хочяень понятно и все такое там жили были дед да баба. Проверочный текст, о том как мы пишем чирк все хочяень понятно и все такое там жили были дед да баба. Проверочный текст, о том как мы пишем чирк все хочяень понятно и все так.",
        user: _initUser(userId),
        likeCount: i * 5,
        disLikeCount: i * 4,
      );
      chirkList.add(chirk);
    }
    return chirkList;
  }

  static User _initUser(int userId) {
    return User(
        id: userId,
        iconId: 1,
        name: "Иван",
        surname: "Сидоров",
        login: "ivan@sidorov.ru",
        password: ":OHG:25L:JHG");
  }

}
class LikedChirkListServiceList implements IChirkListService{
int _userId;


LikedChirkListServiceList(this._userId);

  static List<Chirk> _initChirkList() {
    List<Chirk> chirkList = [];
    var rnd = Random();
    for (int i = 0; i < 10; i++) {
      var chirk = Chirk(
        id: i * 3,
        dateTime: DateTime.now(),
        text:
        "Проверочный текст, о том как мы пишем чирк все хочяень понятно и все такое там жили были дед да баба. Проверочный текст, о том как мы пишем чирк все хочяень понятно и все такое там жили были дед да баба. Проверочный текст, о том как мы пишем чирк все хочяень понятно и все так.",
        user: User(
            id: i + 1,
            iconId: rnd.nextInt(6),
            name: "Петр",
            surname: "Николаевич",
            login: "petr@nicol.com",
            password: ":OHG:25L:JHG"),
        likeCount: i * 5,
        disLikeCount: i * 4,
        liked: true,
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
  List<Chirk> getChirks() {
    return _initChirkList();
  }
}
class DislikedChirkListServiceList implements IChirkListService{
  int _userId;


  DislikedChirkListServiceList(this._userId);


  static List<Chirk> _initChirkList() {
    List<Chirk> chirkList = [];
    var rnd = Random();
    for (int i = 0; i < 10; i++) {
      var chirk = Chirk(
        id: i * 3,
        dateTime: DateTime.now(),
        text:
        "Проверочный текст, о том как мы пишем чирк все хочяень понятно и все такое там жили были дед да баба. Проверочный текст, о том как мы пишем чирк все хочяень понятно и все такое там жили были дед да баба. Проверочный текст, о том как мы пишем чирк все хочяень понятно и все так.",
        user: User(
            id: i + 1,
            iconId: rnd.nextInt(6),
            name: "Петр",
            surname: "Николаевич",
            login: "petr@nicol.com",
            password: ":OHG:25L:JHG"),
        likeCount: i * 5,
        disLikeCount: i * 4,
        liked: false,
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
  List<Chirk> getChirks() {
    return _initChirkList();
  }
}
