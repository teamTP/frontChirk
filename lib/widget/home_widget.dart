import 'dart:math';
import 'package:chirk/provider/user_provider.dart';
import 'package:chirk/widget/unlogin/unlogin_add_chirk_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../entity/user.dart';
import '../model/chirk_list_model.dart';
import '../service/chirk_list_service_dio.dart';
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

  List<Widget> _widgetOptions = <Widget>[
  //ChirkListWidget(initChirkList()),
  ChirkListWidget(
  "Лента чирков",
  (context) =>
  ChirkListWM(ChirkListModelDIO(ChirkListType.standard))),
  CircularProgressIndicator(),
    CircularProgressIndicator(),
  ];
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      bottomNavigationBar: NavigationBar(
      selectedIndex: _selectedIndex,
      onDestinationSelected: (value) => _onItemTapped(value),
      destinations: const <NavigationDestination>[
        NavigationDestination(icon: Icon(Icons.list), label: "Лента чирков"),
        NavigationDestination(icon: Icon(Icons.add), label: "Создать чирк"),
        NavigationDestination(icon: Icon(Icons.person), label: "Профиль"),
      ],
    ),
      body: Consumer<UserProvider>(
          builder: (context, userProvider, child) {
            Future<User?> user = userProvider.user;
            userProvider.user.then((value) => _widgetOptions = <Widget>[
              //ChirkListWidget(initChirkList()),
              ChirkListWidget(
                  "Лента чирков",
                      (context) =>
                      ChirkListWM(ChirkListModelDIO(ChirkListType.standard))),
              if (value == null) Text('без пользователя') else AddChirkWidget(),
              ProfileWidget(initUser()),
            ]);
            return IndexedStack(
              index: _selectedIndex,
              children: _widgetOptions,
            );
          }
      ),
      /*body: IndexedStack(
        index: _selectedIndex,
        children: _widgetOptions,
      ),*/

    );
  }


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static User initUser() {
    return User(
        id: 1,
        iconId: 0,
        name: "Иван",
        surname: "Сидоров",
        login: "ivan@sidorov.ru",
        password: ":OHG:25L:JHG");
  }
}
