import 'dart:math';

import 'package:chirk/activities/new%20test/abstractActivity.dart';
import 'package:chirk/activities/new%20test/abstractStandartState.dart';
import 'package:chirk/models/chirkMessage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:jiffy/jiffy.dart';

class TestActivity extends AbstractActivity{
  TestActivity() : super('Тест');

  @override
  State<StatefulWidget> createState() => _testState(title);

}

class _testState extends AbstractStandardState{
  _testState(super.title);

  @override
  Widget createBody() {
    return addCardList(context, initChirkList());
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

  Widget addCardList(BuildContext context, List<Chirk> chirkList) {
    return ListView.builder(
      itemCount: chirkList.length,
      itemBuilder: (BuildContext context, int index) {
        return chirkCard(context, chirkList[index]);
      },
    );
  }

  Widget chirkCard(BuildContext context, Chirk chirk) {
    Jiffy.setLocale("ru");
    return Card(
      child: Column(
        children: [
          ListTile(
            leading: const Icon(Icons.person_2_rounded),
            title: Text("${chirk.userSurname} ${chirk.userName}"),
            subtitle: Text(Jiffy.parseFromDateTime(chirk.dateTime).fromNow()),
            trailing: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.delete),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(16),
            child: Text(chirk.text),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.thumb_up),
              ),
              IconButton(onPressed: () {}, icon: const Icon(Icons.thumb_down)),
            ],
          ),
        ],
      ),
    );
  }
}