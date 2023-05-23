import 'package:chirk/widgetModel/profile/profile_wm.dart';
import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';

class ProfileWidget extends ElementaryWidget<IProfileWM> {
  const ProfileWidget(super.wmFactory, {super.key});

  @override
  Widget build(IProfileWM wm) {
    double size = wm.textTheme.headlineMedium!.fontSize!;
    return Scaffold(
      appBar: AppBar(
        title: Title(
          color: Colors.black,
          child: const Text("Профиль"),
        ),
        actions: <Widget>[
          IconButton(
              onPressed: () => wm.toExit(),
              icon: const Icon(Icons.exit_to_app)),
        ],
      ),
      body: EntityStateNotifierBuilder(
        listenableEntityState: wm.userState,
        builder: (context, user){
          if(user == null){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }else{
            return SafeArea(
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: size / 2, top: size / 2),
                    child: Row(
                      children: [
                        CircleAvatar(
                          //todo иконка по id
                            radius: wm.textTheme.headlineMedium!.fontSize! * 2,
                            backgroundImage: wm.userIcon),
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: size),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    user.name,
                                    style: wm.textTheme.headlineMedium,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        user.surname,
                                        style: wm.textTheme.headlineMedium,
                                      ),
                                      IconButton(
                                          onPressed: () {
                                            wm.toEditProfile();
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
                              style:
                              wm.textTheme.titleMedium?.apply(fontWeightDelta: 1),
                            ),
                            Text("Имя: ${user.name} ${user.surname}"),
                            Text("Логин: ${user.login}"),
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
                              style:
                              wm.textTheme.titleMedium?.apply(fontWeightDelta: 1),
                            ),
                            TextButton.icon(
                              onPressed: () {
                                wm.toMyFeed();
                              },
                              icon: const Icon(Icons.edit),
                              label: const Text(
                                "Мои чирки",
                              ),
                            ),
                            TextButton.icon(
                              onPressed: () {
                                wm.toLikeFeed();
                              },
                              icon: const Icon(Icons.thumb_up),
                              label: const Text(
                                "Понравившееся",
                              ),
                            ),
                            TextButton.icon(
                              onPressed: () {
                                wm.toDislikeFeed();
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
            );
          }
        },
      ),
    );
  }
}
