import 'package:chirk/widget/home_widget.dart';
import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../entity/user.dart';
import '../../provider/user_provider.dart';
import '../../service/userIcons.dart';

class ProfileWidget extends StatefulWidget {
  final User _user;

  const ProfileWidget(this._user, {super.key});

  @override
  State<StatefulWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  HomeWidget homeWidget = HomeWidget();

  @override
  Widget build(BuildContext context) {
    double size = Theme.of(context).textTheme.headlineMedium!.fontSize!;
    return Scaffold(
      appBar: AppBar(
        title: Title(
          color: Colors.black,
          child: const Text("Профиль"),
        ),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                  final tokenProvider = Provider.of<TokenProvider>(context, listen: false);
                  tokenProvider.deleteTokens();
                  Navigator.pushNamed(context, "/login");
              },
              icon: const Icon(Icons.exit_to_app)),
        ],
      ),
      body: SafeArea(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: size / 2, top: size / 2),
              child: Row(
                children: [
                  CircleAvatar(
                      //todo иконка по id
                      radius: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .fontSize! *
                          2,
                      backgroundImage:
                          UserIcon.getImageById(widget._user.iconId)),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: size),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget._user.name,
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                            Row(
                              children: [
                                Text(
                                  widget._user.surname,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium,
                                ),
                                IconButton(
                                    onPressed: () {
                                      setState(() {});
                                      //todo перреход на редактирование профиля
                                      Navigator.pushNamed(context, "/edit");
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
              margin: EdgeInsets.only(bottom: size / 2),
              child: Card(
                child: Container(
                  padding: EdgeInsets.all(size / 2),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Персональные данные",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.apply(fontWeightDelta: 1),
                      ),
                      Text("Имя: ${widget._user.name} ${widget._user.surname}"),
                      Text("Логин: ${widget._user.login}"),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: size / 2),
              child: Card(
                child: Container(
                  padding: EdgeInsets.all(size / 2),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Чирки",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.apply(fontWeightDelta: 1),
                      ),
                      TextButton.icon(
                        onPressed: () {
                          Navigator.of(context).pushNamed("/myChirk");
                          //todo переход на ленту мои чирки
                        },
                        icon: const Icon(Icons.edit),
                        label: const Text(
                          "Мои чирки",
                        ),
                      ),
                      TextButton.icon(
                        onPressed: () {
                          Navigator.of(context).pushNamed("/likedChirk");
                          //todo переход на ленту понравившееся
                        },
                        icon: const Icon(Icons.thumb_up),
                        label: const Text(
                          "Понравившееся",
                        ),
                      ),
                      TextButton.icon(
                        onPressed: () {
                          Navigator.of(context).pushNamed("/dislikedChirk");
                          //todo переход на ленту не понравившееся
                        },
                        icon: const Icon(Icons.thumb_down),
                        label: const Text(
                          "Не понравившееся",
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            EasyDynamicThemeBtn(),
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
