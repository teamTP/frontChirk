import 'package:appmetrica_plugin/appmetrica_plugin.dart';
import 'package:chirk/widgetModel/profile/profile_wm.dart';
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
        builder: (context, user) {
          if (user == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return SafeArea(
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child:
                    Container(
                      margin: EdgeInsets.only(top: size / 2, left: size / 2),
                      child: Row(
                        children: [
                          CircleAvatar(
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
                  ),
                  Card(
                    child: Container(
                      padding: EdgeInsets.all(size / 2),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Персональные данные",
                            style: wm.textTheme.titleMedium
                                ?.apply(fontWeightDelta: 1),
                          ),
                          Text("Имя: ${user.name} ${user.surname}"),
                          Text("Логин: ${user.login}"),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    child: Container(
                      padding: EdgeInsets.all(size / 2),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Чирки",
                            style: wm.textTheme.titleMedium
                                ?.apply(fontWeightDelta: 1),
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
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
