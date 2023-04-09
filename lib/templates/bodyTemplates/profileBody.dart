import 'package:flutter/material.dart';

import '../../models/user.dart';

class ProfileBody {
  static Widget addProfileBody(User user) {
    double fntSize = 24;
    return SafeArea(
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: fntSize/2, top: fntSize/2),
              child: Row(
                children: [
                  const CircleAvatar(//todo иконка по id
                      radius: 64, backgroundImage: AssetImage('img/hasta.jpg')),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: fntSize),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(user.name,
                                style: TextStyle(
                                  fontSize: fntSize,
                                )),
                            Row(
                              children: [
                                Text(user.surname,
                                    style: TextStyle(
                                      fontSize: fntSize,
                                    )),
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
              margin: EdgeInsets.only(bottom: fntSize/2),
              child: Card(
                child: Container(
                  padding: EdgeInsets.all(fntSize / 2),
                  child: Column(
                    children: [
                      Text(
                        "Чирки",
                        style: TextStyle(
                            fontSize: fntSize, fontWeight: FontWeight.bold),
                      ),
                      TextButton(
                        onPressed: () {
                          //todo переход на ленту мои чирки
                        },
                        child: ListTile(
                          leading: Icon(Icons.edit),
                          title: Text(
                            "Мои чирки",
                            style: TextStyle(fontSize: fntSize),
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {

                          //todo переход на ленту понравившееся
                        },
                        child: ListTile(
                          leading: Icon(Icons.thumb_up),
                          title: Text(
                            "Понравившееся",
                            style: TextStyle(fontSize: fntSize),
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                  //todo переход на ленту не понравившееся
                  },
                        child: ListTile(
                          leading: Icon(Icons.thumb_down),
                          title: Text(
                            "Не понравившееся",
                            style: TextStyle(fontSize: fntSize),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: fntSize/2),
              child: Card(
                child: Container(
                  padding: EdgeInsets.all(fntSize / 2),
                  child: Column(
                    children: [
                      Text(
                        "Персональные данные",
                        style: TextStyle(
                            fontSize: fntSize, fontWeight: FontWeight.bold),
                      ),
                      ListTile(
                        leading: Text(
                          "Имя:",
                          style: TextStyle(fontSize: fntSize),
                        ),
                        title: Text(
                          "${user.name} ${user.surname}",
                          style: TextStyle(fontSize: fntSize),
                        ),
                      ),
                      ListTile(
                        leading: Text(
                          "Логин:",
                          style: TextStyle(fontSize: fntSize),
                        ),
                        title: Text(
                          user.login,
                          style: TextStyle(fontSize: fntSize),
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
