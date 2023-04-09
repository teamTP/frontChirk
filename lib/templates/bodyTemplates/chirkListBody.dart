import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';

import '../../models/chirkMessage.dart';

class CardList {
  static Widget addCardList(BuildContext context, List<Chirk> chirkList) {
    return ListView.builder(
      itemCount: chirkList.length,
      itemBuilder: (BuildContext context, int index) {
        return _chirkCard(context, chirkList[index]);
      },
    );
  }

  static Widget _chirkCard(BuildContext context, Chirk chirk) {
    Jiffy.setLocale("ru");
    return Card(
      child: Column(
        children: [
          ListTile(
            leading: const Icon(Icons.person_2_rounded),
            title: Text("${chirk.userSurname} ${chirk.userName}"),
            subtitle: Text(Jiffy.parseFromDateTime(chirk.dateTime).fromNow()),
            trailing: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.delete),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(16),
            child: Text(chirk.text),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.thumb_up),
              ),
              IconButton(onPressed: () {}, icon: const Icon(Icons.thumb_down)),
            ],
          ),
        ],
      ),
    );
  }
}
