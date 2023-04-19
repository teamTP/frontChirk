import 'dart:math';

import '../../models/chirk.dart';
import '../../models/user.dart';

abstract class IChirkListService{
  List<Chirk> get chirks;
}

class ChirkListServiceList implements IChirkListService{
  @override
  List<Chirk> get chirks => initChirkList();


  static List<Chirk> initChirkList() {
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

  static User initUser() {
    return User(
        id: 1,
        iconId: 1,
        name: "Иван",
        surname: "Сидоров",
        login: "ivan@sidorov.ru",
        password: ":OHG:25L:JHG");
  }
}
