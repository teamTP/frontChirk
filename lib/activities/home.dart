import 'dart:math';

import 'package:chirk/models/chirkMessage.dart';
import 'package:chirk/templates/template.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<StatefulWidget> createState() => _FeedState();
}

class _FeedState extends State<StatefulWidget> {
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

  @override
  Widget build(BuildContext context) {
    List<Chirk> chirkList = initChirkList();
    String title = "Лента виджетов";
    return standardNavigation(
        context,
        title,
        addCardList(
            context,
            chirkList
        ),
    );
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

  Widget standardNavigation(BuildContext context, String title, Widget body) {
    return Scaffold(
      appBar: AppBar(
        title: Title(
          color: Colors.black,
          child: Text(title),
        ),
      ),
      body: body,
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.list), label: "Лента чирков"),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: "Создать чирк"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Профиль"),
        ],
      ),
    );
  }
}
