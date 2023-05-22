import 'package:chirk/widgetModel/chirk/chirk_wm.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:jiffy/jiffy.dart';

import '../../entity/chirk.dart';
import '../../service/userIcons.dart';

class ChirkWidget extends ElementaryWidget<IChirkWM> {
  ChirkWidget(super.wmFactory);

  @override
  Widget build(IChirkWM wm) {
    ColorScheme colors = wm.theme.colorScheme;
    Jiffy.setLocale("ru");
    return Card(
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              radius: wm.theme.textTheme.headlineMedium!.fontSize!,
              backgroundImage: wm.getImage(),
            ),
            title: Text(
                "${wm.chirkState.value!.data!.user.surname} ${wm.chirkState.value!.data!.user.name}"),
            subtitle: Text(
                Jiffy.parseFromDateTime(wm.chirkState.value!.data!.dateTime)
                    .fromNow()),
            trailing: IconButton(
              style: IconButton.styleFrom(
              foregroundColor: false
                  ? colors.onPrimary
                  : colors.primary,
              backgroundColor: false
                  ? colors.primary
                  : colors.surfaceVariant,
              disabledForegroundColor:
              colors.onSurface.withOpacity(0.38),
              disabledBackgroundColor:
              colors.onSurface.withOpacity(0.12),
            ),
              onPressed: () {
                //todo реализовать нажатие и отображение кнопки delete
              },
              icon: const Icon(Icons.delete),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(16),
            child: Text(wm.chirkState.value!.data!.text),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 6, 6),
            child: EntityStateNotifierBuilder(
              listenableEntityState: wm.chirkState,
              builder: (context, chirk) {
                if (chirk == null) {
                  return CircularProgressIndicator();
                }

                return Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  IconButton(
                    style: IconButton.styleFrom(
                      foregroundColor: (chirk.liked ?? false)
                          ? colors.onPrimary
                          : colors.primary,
                      backgroundColor: (chirk.liked ?? false)
                          ? colors.primary
                          : colors.surfaceVariant,
                      disabledForegroundColor:
                          colors.onSurface.withOpacity(0.38),
                      disabledBackgroundColor:
                          colors.onSurface.withOpacity(0.12),
                    ),
                    isSelected: chirk.liked,
                    onPressed: () {
                      wm.onTapLike();
                      //todo реализвать нажатие кнопки like
                    },
                    icon: const Icon(
                      Icons.thumb_up,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(6, 0, 0, 0),
                    child: Text("${chirk.likeCount} : "),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 6, 0),
                    child: Text("${chirk.disLikeCount}"),
                  ),
                  IconButton(
                    style: IconButton.styleFrom(
                      foregroundColor: !(chirk.liked ?? true)
                          ? colors.onPrimary
                          : colors.primary,
                      backgroundColor: !(chirk.liked ?? true)
                          ? colors.primary
                          : colors.surfaceVariant,
                      disabledForegroundColor:
                          colors.onSurface.withOpacity(0.38),
                      disabledBackgroundColor:
                          colors.onSurface.withOpacity(0.12),
                    ),
                    isSelected: !(chirk.liked ?? true),
                    onPressed: () {
                      print(chirk.liked);
                      wm.onTapDislike();
                      print(chirk.liked);
                      //todo реализвать нажатие кнопки dislike
                    },
                    icon: const Icon(
                      Icons.thumb_down,
                    ),
                  ),
                ]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
