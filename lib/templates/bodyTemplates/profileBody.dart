import 'package:flutter/material.dart';

class ProfileBody {
  static Widget addProfileBody() {
    double fntSize = 20;
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(
            left: fntSize / 2,
            right: fntSize / 2,
            top: fntSize / 2,
            bottom: fntSize / 2),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: fntSize/2),
              child: Row(
                children: [
                  const CircleAvatar(
                      radius: 64, backgroundImage: AssetImage('img/hasta.jpg')),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: fntSize),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Иван",
                                style: TextStyle(
                                  fontSize: 20,
                                )),
                            Row(
                              children: [
                                const Text("Сидоров",
                                    style: TextStyle(
                                      fontSize: 20,
                                    )),
                                IconButton(
                                    onPressed: () {},
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
                        onPressed: () {},
                        child: ListTile(
                          leading: Icon(Icons.edit),
                          title: Text(
                            "Мои чирки",
                            style: TextStyle(fontSize: fntSize),
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: ListTile(
                          leading: Icon(Icons.thumb_up),
                          title: Text(
                            "Понравившееся",
                            style: TextStyle(fontSize: fntSize),
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
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
                          "Иван Сидоров",
                          style: TextStyle(fontSize: fntSize),
                        ),
                      ),
                      ListTile(
                        leading: Text(
                          "Логин:",
                          style: TextStyle(fontSize: fntSize),
                        ),
                        title: Text(
                          "ivan@sidorov.ru",
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
      ),
    );
  }
}
