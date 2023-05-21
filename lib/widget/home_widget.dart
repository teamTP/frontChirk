import 'dart:math';

import 'package:flutter/material.dart';

import '../config.dart';
import '../entity/user.dart';
import '../model/chirk_list_model.dart';
import 'chirk_widget/add_chirk.dart';
import 'chirk_widget/chirk_list_widget.dart';
import 'profile/profileWidget.dart';
import '../widgetModel/chirk_list_wm.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<StatefulWidget> createState() => _MyState();
}

class _MyState extends State<StatefulWidget> {
  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = <Widget>[
    //ChirkListWidget(initChirkList()),
    ChirkListWidget("Лента чирков",
        (context) => ChirkListWM(ChirkListModelDIO(ChirkListType.standard))),
    const AddChirkWidget(),
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
      body: IndexedStack(
        index: _selectedIndex,
        children: _widgetOptions,
      ),
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
