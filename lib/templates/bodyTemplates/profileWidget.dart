import 'dart:js';

import 'package:flutter/material.dart';

import '../../models/user.dart';
import '../userIcons.dart';

class ProfileWidget extends StatefulWidget {
  User _user;

  ProfileWidget(this._user, {super.key});

  @override
  State<StatefulWidget> createState() => _profileState(_user);
}

class _profileState extends State<ProfileWidget> {
  User _user;

  _profileState(this._user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Title(
          color: Colors.black,
          child: Text("Профиль"),
        ),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, "/login");
              },
              icon: Icon(Icons.exit_to_app)),
        ],
      ),
      body: addProfileBody(context),
    );
  }

  Widget addProfileBody(BuildContext context) {
    double fntSize = 24;
    return SafeArea(
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: fntSize / 2, top: fntSize / 2),
            child: Row(
              children: [
                CircleAvatar(
                    //todo иконка по id
                    radius:
                        Theme.of(context).textTheme.headlineMedium!.fontSize! *
                            2,
                    backgroundImage: UserIcon.getImageById(_user.iconId)),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: fntSize),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _user.name,
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          Row(
                            children: [
                              Text(
                                _user.surname,
                                style:
                                    Theme.of(context).textTheme.headlineMedium,
                              ),
                              IconButton(
                                  onPressed: () {
                                    //todo перреход на редактирование профиля
                                  },
                                  icon: const Icon(Icons.edit)),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: fntSize / 2),
            child: Card(
              child: Container(
                padding: EdgeInsets.all(fntSize / 2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Персональные данные",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    Text("Имя: ${_user.name} ${_user.surname}"),
                    Text("Логин: ${_user.login}"),
                  ],
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: fntSize / 2),
            child: Card(
              child: Container(
                padding: EdgeInsets.all(fntSize / 2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Чирки",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    TextButton.icon(
                      onPressed: () {
                        //todo переход на ленту мои чирки
                      },
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.black,
                      ),
                      icon: Icon(Icons.edit),
                      label: Text(
                        "Мои чирки",
                      ),
                    ),
                    TextButton.icon(
                      onPressed: () {
                        //todo переход на ленту понравившееся
                      },
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.black,
                      ),
                      icon: Icon(Icons.thumb_up),
                      label: Text(
                        "Понравившееся",
                      ),
                    ),
                    TextButton.icon(
                      onPressed: () {
                        //todo переход на ленту не понравившееся
                      },
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.black,
                      ),
                      icon: Icon(Icons.thumb_down),
                      label: Text(
                        "Не понравившееся",
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          /*Card(
              child: Row(
                children: [
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(
                            left: 12, right: 12, top: 12, bottom: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(bottom: 12),
                              child: const Text("Персональные данные",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                  )),
                            ),
                            Row(
                              children: const [
                                Text("Имя: Иван Сидоров",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400,
                                    )),
                              ],
                            ),
                            Row(
                              children: const [
                                Text("Login: ivan@sidorov.ru",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400,
                                    )),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),*/ //старая карточка
        ],
      ),
    );
  }
}
