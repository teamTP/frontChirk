import 'package:chirk/templates/abstractPage.dart';
import 'package:chirk/templates/abstractStandartState.dart';
import 'package:flutter/material.dart';

class ProfilePage extends AbstractPage {
  ProfilePage() : super('Тест');

  @override
  State<StatefulWidget> createState() => _profileState(title);
}

class _profileState extends AbstractNavigationState {
  _profileState(super.title);

  @override
  Widget createBody() {
    return SafeArea(
      child: Padding(
        padding:
            const EdgeInsets.only(left: 12, right: 12, top: 12, bottom: 12),
        child: Column(
          children: [
            Row(
              children: [
                const CircleAvatar(
                  radius: 64,
                  backgroundImage: AssetImage('img/hasta.jpg')
                ),
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Иван",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                              )),
                          Row(
                            children: [
                              const Text("Сидоров",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
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
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.2),
                    blurRadius: 3,
                    offset: Offset(0, 1),
                  ),
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.12),
                    blurRadius: 1,
                    offset: Offset(0, 2),
                  ),
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.14),
                    blurRadius: 1,
                    offset: Offset(0, 1),
                  ),
                ],
              ),
              margin:
                  const EdgeInsets.only(top: 12, bottom: 12, right: 0, left: 0),
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
                              margin: const EdgeInsets.only(
                                 bottom: 12),
                              child: const Text("Чирки ",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,

                                  )),
                            ),
                            Row(
                              children: [
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.edit)),
                                const Text("Мои чирки",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400,
                                    )),
                              ],
                            ),
                            Row(
                              children: [
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.thumb_up)),
                                const Text("Понравившиеся",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400,
                                    )),
                              ],
                            ),
                            Row(
                              children: [
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.thumb_down)),
                                const Text("Не понравившиеся",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400,
                                    )),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.2),
                    blurRadius: 3,
                    offset: Offset(0, 1),
                  ),
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.12),
                    blurRadius: 1,
                    offset: Offset(0, 2),
                  ),
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.14),
                    blurRadius: 1,
                    offset: Offset(0, 1),
                  ),
                ],
              ),
              margin:
              const EdgeInsets.only(top: 12, bottom: 12, right: 0, left: 0),
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
                              margin: const EdgeInsets.only(
                                  bottom: 12),
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
            )
          ],
        ),
      ),
    );
  }
}
