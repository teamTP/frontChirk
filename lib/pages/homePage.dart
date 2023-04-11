import 'dart:math';
import 'package:chirk/pages/loginPage.dart';
import 'package:chirk/templates/bodyTemplates/profileWidget.dart';
import 'package:flutter/material.dart';

import '../models/chirkMessage.dart';
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
    ChirkListWidget(initChirkList()),
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
      bottomNavigationBar:
          BottomNavigationBar(items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.list), label: "Лента чирков"),
        BottomNavigationBarItem(icon: Icon(Icons.add), label: "Создать чирк"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Профиль"),
      ], currentIndex: _selectedIndex, onTap: (value) => _onItemTapped(value)),
    );
  }

  static List<Chirk> initChirkList() {
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

  static User initUser() {
    return User(1, 1, "Иван", "Сидоров", "ivan@sidorov.ru");
  }


}
