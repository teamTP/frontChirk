import 'dart:math';

import 'package:chirk/templates/bodyTemplates/profileWidget.dart';
import 'package:flutter/material.dart';

import '../elementaryTest/model/chirk_list_model.dart';
import '../elementaryTest/service/chirl_list_service.dart';
import '../elementaryTest/widget/chirk_list_widget.dart';
import '../elementaryTest/widgetModel/chirk_list_wm.dart';
import '../models/chirk.dart';
import '../models/user.dart';
import '../templates/bodyTemplates/chirkListWidget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _MyState();
}

class _MyState extends State<StatefulWidget> {
  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = <Widget>[
    //ChirkListWidget(initChirkList()),
    ChirkListWidgetEl((context) => ChirkListWM(ChirkListModel(ChirkListServiceList()))),
    Text("В разработке"),
    ProfileWidget(initUser()),
  ];

  @override
  Widget build(BuildContext context) => navigatorBarPage(context);

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget navigatorBarPage(BuildContext context) {
    return Scaffold(
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (value) => _onItemTapped(value),
        destinations: const <NavigationDestination>[
          NavigationDestination(icon: Icon(Icons.list), label: "Лента чирков"),
          NavigationDestination(icon: Icon(Icons.add), label: "Создать чирк"),
          NavigationDestination(icon: Icon(Icons.person), label: "Профиль"),
        ],
      ),
    );
  }

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
