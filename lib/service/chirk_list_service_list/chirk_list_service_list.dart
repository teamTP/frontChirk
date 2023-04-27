
import 'dart:math';

import '../../entity/chirk.dart';
import '../../entity/user.dart';
import 'ichirk_list_service_list.dart';

class ChirkListServiceList implements IChirkListServiceList{

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
  @override
  List<Chirk> getChirks() {
    return initChirkList();
  }
}