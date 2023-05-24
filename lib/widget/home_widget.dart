import 'package:chirk/model/chirk/add_chirk_model.dart';
import 'package:chirk/widget/chirk/add_chirk_widget.dart';
import 'package:chirk/widgetModel/chirk/add_chirk_wm.dart';
import 'package:chirk/model/profile/profile_model.dart';
import 'package:chirk/widget/profile/profile_widget.dart';
import 'package:chirk/widgetModel/profile/profile_wm.dart';
import 'package:chirk/provider/user_provider.dart';
import 'package:chirk/widget/unlogin/unlogin_add_chirk_widget.dart';
import 'package:chirk/widget/unlogin/unlogin_profile_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:chirk/entity/user.dart';
import 'package:chirk/model/chirk/chirk_list_model.dart';
import 'package:chirk/widgetModel/chirk/chirk_list_wm.dart';
import 'chirk/chirk_list_widget.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<StatefulWidget> createState() => _MyState();
}

class _MyState extends State<StatefulWidget> {
  int _selectedIndex = 0;
  bool? _hasToken = false;

  final List<Widget> _widgetOptionsWithoutToken = <Widget>[
    ChirkListWidget("Лента чирков",
        (context) => ChirkListWM(ChirkListModelDIO(ChirkListType.standard))),
    const UnloginAddChirkWidget(),
    const UnloginProfileWidget(),
  ];

  final List<Widget> _widgetOptionsWithToken = <Widget>[
    ChirkListWidget("Лента чирков",
        (context) => ChirkListWM(ChirkListModelDIO(ChirkListType.standard))),
    AddChirkWidget((context) => AddChirkWM(AddChirkModel())),
    ProfileWidget((context) => ProfileWM(ProfileModel())),
  ];
  final List<Widget> _widgetLoading = <Widget>[
    const Center(
      child: CircularProgressIndicator(),
    ),
    const Center(
      child: CircularProgressIndicator(),
    ),
    const Center(
      child: CircularProgressIndicator(),
    ),
  ];

  List<Widget> get _page => _hasToken == null
      ? _widgetLoading
      : _hasToken == true
          ? _widgetOptionsWithToken
          : _widgetOptionsWithoutToken;

  @override
  Widget build(BuildContext context) {
    return Consumer<TokenProvider>(builder: (context, tokenProvider, _) {
      return FutureBuilder<String?>(
        future: tokenProvider.accessToken,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            _hasToken = null;
            return Scaffold(
              bottomNavigationBar: NavigationBar(
                selectedIndex: _selectedIndex,
                onDestinationSelected: (value) => _onItemTapped(value),
                destinations: const <NavigationDestination>[
                  NavigationDestination(
                      icon: Icon(Icons.list), label: "Лента чирков"),
                  NavigationDestination(
                      icon: Icon(Icons.add), label: "Создать чирк"),
                  NavigationDestination(
                      icon: Icon(Icons.person), label: "Профиль"),
                ],
              ),
              body: IndexedStack(
                index: _selectedIndex,
                children: _page,
              ),
              /*body: IndexedStack(
        index: _selectedIndex,
        children: _widgetOptions,
      ),*/
            );
          } else if (snapshot.hasData && snapshot.data != null) {
            _hasToken = true;
            return Scaffold(
              bottomNavigationBar: NavigationBar(
                selectedIndex: _selectedIndex,
                onDestinationSelected: (value) => _onItemTapped(value),
                destinations: const <NavigationDestination>[
                  NavigationDestination(
                      icon: Icon(Icons.list), label: "Лента чирков"),
                  NavigationDestination(
                      icon: Icon(Icons.add), label: "Создать чирк"),
                  NavigationDestination(
                      icon: Icon(Icons.person), label: "Профиль"),
                ],
              ),
              body: IndexedStack(
                index: _selectedIndex,
                children: _page,
              ),
              /*body: IndexedStack(
        index: _selectedIndex,
        children: _widgetOptions,
      ),*/
            );
          }else{
            _hasToken = false;
            return Scaffold(
              bottomNavigationBar: NavigationBar(
                selectedIndex: _selectedIndex,
                onDestinationSelected: (value) => _onItemTapped(value),
                destinations: const <NavigationDestination>[
                  NavigationDestination(
                      icon: Icon(Icons.list), label: "Лента чирков"),
                  NavigationDestination(
                      icon: Icon(Icons.add), label: "Создать чирк"),
                  NavigationDestination(
                      icon: Icon(Icons.person), label: "Профиль"),
                ],
              ),
              body: IndexedStack(
                index: _selectedIndex,
                children: _page,
              ),
              /*body: IndexedStack(
        index: _selectedIndex,
        children: _widgetOptions,
      ),*/
            );
          }
        },
      );
    });
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
