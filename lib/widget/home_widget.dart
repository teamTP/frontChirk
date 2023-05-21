import 'package:chirk/widget/unlogin/unlogin_add_chirk_widget.dart';
import 'package:flutter/material.dart';

import '../entity/user.dart';
import '../model/chirk_list_model.dart';
import '../service/chirk_list_service_list/chirk_list_service_list.dart';
import '../widgetModel/chirk_list_wm.dart';
import 'chirk_widget/chirk_list_widget.dart';
import 'profile/profileWidget.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget( {super.key});

  @override
  State<StatefulWidget> createState() => _MyState();



}

class _MyState extends State<StatefulWidget> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    //ChirkListWidget(initChirkList()),
    ChirkListWidget("Лента чирков",
        (context) => ChirkListWM(ChirkListModel(ChirkListServiceList()))),
    UnloginAddChirkWidget(),
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
