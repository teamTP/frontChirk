import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';

import '../../models/chirkMessage.dart';
import '../../theme/theme.dart';

class CardList{
  static Widget addCardList(BuildContext context, List<Chirk> chirkList){
    return ListView.builder(
      itemCount: chirkList.length,
      itemBuilder: (BuildContext context, int index) {
        return _chirkCard(context, chirkList[index]);
      },
    );
  }

  static Widget _chirkCard(BuildContext context, Chirk chirk) {
    List<Color?> likeColors = _getColorLike(context, chirk.liked);
    Jiffy.setLocale("ru");
    return Card(
      child: Column(
        children: [
          ListTile(
            leading: const Icon(Icons.person_2_rounded),
            title: Text("${chirk.userSurname} ${chirk.userName}"),
            subtitle: Text(Jiffy.parseFromDateTime(chirk.dateTime).fromNow()),
            trailing: IconButton(
              onPressed: () {
                //todo реализовать нажатие и отображение кнопки delete
              },
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
                onPressed: () {
                  //todo реализвать нажатие кнопки like
                },
                icon: Icon(
                  Icons.thumb_up,
                  color: likeColors.first,
                ),
              ),
              IconButton(
                onPressed: () {
                  //todo реализвать нажатие кнопки dislike
                },
                icon: Icon(
                  Icons.thumb_down,
                  color: likeColors.last,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  static List<Color?> _pressLikeButton(
      BuildContext context, bool pressedButton, Chirk chirk) {
    if (chirk.liked == pressedButton) {
      chirk.liked = null;
    } else {
      chirk.liked = pressedButton;
    }
    return _getColorLike(context, chirk.liked);
  }

  static List<Color?> _getColorLike(BuildContext context, bool? likeState) {
    Color? likeColor;
    Color? dislikeColor;
    if (likeState == null) {
      likeColor = Theme.of(context).primaryIconTheme.color;
      dislikeColor = Theme.of(context).primaryIconTheme.color;
    } else if (likeState ?? true) {
      likeColor = Theme.of(context).canvasColor;
      dislikeColor = Theme.of(context).primaryIconTheme.color;
    } else {
      dislikeColor = Theme.of(context).canvasColor;
      likeColor = Theme.of(context).primaryIconTheme.color;
    }
    return [likeColor, dislikeColor];
  }
}
