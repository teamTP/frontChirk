import 'dart:math';
import 'package:chirk/templates/bodyTemplates/profileBody.dart';
import 'package:flutter/material.dart';

import '../models/chirkMessage.dart';
import '../models/user.dart';
import '../templates/bodyTemplates/chirkListBody.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _MyState();
}

class _MyState extends State<StatefulWidget> {
  int _selectedIndex = 0;
  List<String> _titleOptions = [];
  List<Widget> _widgetOptions = [];

  _MyState() {
    _titleOptions = <String>["Лента чирков", "Создать чирк", "Профиль"];
    _widgetOptions = <Widget>[
      CardList.addCardList(initChirkList()),
      const Text(
        'Реализация позже',
      ),
      ProfileBody.addProfileBody(initUser()),
    ];
  }

  @override
  Widget build(BuildContext context) => navigatorBarPage(context);

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget navigatorBarPage(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Title(
          color: Colors.black,
          child: Text(_titleOptions[_selectedIndex]),
        ),
      ),
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar:
          BottomNavigationBar(items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.list), label: "Лента чирков"),
        BottomNavigationBarItem(icon: Icon(Icons.add), label: "Создать чирк"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Профиль"),
      ], currentIndex: _selectedIndex, onTap: (value) => _onItemTapped(value)),
    );
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

  User initUser() {
    return User(1, 1, "Иван", "Сидоров", "ivan@sidorov.ru");
  }
}
