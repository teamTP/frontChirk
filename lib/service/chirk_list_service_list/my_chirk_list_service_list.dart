
import 'dart:math';

import '../../entity/chirk.dart';
import '../../entity/user.dart';
import '../chirl_list_service.dart';
import 'ichirk_list_service_list.dart';

class MyChirkListServiceList implements IChirkListServiceList{
  int userId;

  MyChirkListServiceList(this.userId);

  @override
  List<Chirk> getChirks() {
    return initChirkList();
  }
  @override
  List<Chirk> initChirkList() {
    List<Chirk> chirkList = [];
    var rnd = Random();
    for (int i = 0; i < 10; i++) {
      var chirk = Chirk(
        id: i * 3,
        dateTime: DateTime.now(),
        text:
        "Проверочный текст, о том как мы пишем чирк все хочяень понятно и все такое там жили были дед да баба. Проверочный текст, о том как мы пишем чирк все хочяень понятно и все такое там жили были дед да баба. Проверочный текст, о том как мы пишем чирк все хочяень понятно и все так.",
        user: initUser(userId),
        likeCount: i * 5,
        disLikeCount: i * 4,
      );
      chirkList.add(chirk);
    }
    return chirkList;
  }

  User initUser(int userId) {
    return User(
        id: userId,
        iconId: 1,
        name: "Иван",
        surname: "Сидоров",
        login: "ivan@sidorov.ru",
        password: ":OHG:25L:JHG");
  }

}