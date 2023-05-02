import 'package:chirk/widgetModel/chirk_wm.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:jiffy/jiffy.dart';

import '../../entity/chirk.dart';
import '../../service/userIcons.dart';

class ChirkWidgetEl extends ElementaryWidget<ChirkWM> {
  ChirkWidgetEl(super.wmFactory);

  @override
  Widget build(ChirkWM wm) {
    ColorScheme colors = Theme.of(wm.context).colorScheme;
    Jiffy.setLocale("ru");
    return Card(
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              radius: Theme.of(wm.context).textTheme.headlineMedium!.fontSize!,
              backgroundImage: wm.getImage(),
            ),
            title: Text("${wm.chirk.user.surname} ${wm.chirk.user.name}"),
            subtitle:
                Text(Jiffy.parseFromDateTime(wm.chirk.dateTime).fromNow()),
            /*trailing: IconButton(
              onPressed: () {
                //todo реализовать нажатие и отображение кнопки delete
              },
              icon: const Icon(Icons.delete),
            ),*/
          ),
          Container(
            margin: const EdgeInsets.all(16),
            child: Text(wm.chirk.text),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 6, 6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                EntityStateNotifierBuilder(
                  listenableEntityState: wm.chirkState,
                  builder: (context, chirk) {
                    if(chirk == null){
                      return Container();
                    }

                    return IconButton(
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
                        print(wm.chirk.liked);
                        wm.onTapLike();
                        print(wm.chirk.liked);
                        //todo реализвать нажатие кнопки like
                      },
                      icon: const Icon(
                        Icons.thumb_up,
                      ),
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(6, 0, 0, 0),
                  child: Text("${wm.chirk.likeCount} : "),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 6, 0),
                  child: Text("${wm.chirk.disLikeCount}"),
                ),
                IconButton(
                  style: IconButton.styleFrom(
                    foregroundColor: !(wm.chirk.liked ?? true)
                        ? colors.onPrimary
                        : colors.primary,
                    backgroundColor: !(wm.chirk.liked ?? true)
                        ? colors.primary
                        : colors.surfaceVariant,
                    disabledForegroundColor: colors.onSurface.withOpacity(0.38),
                    disabledBackgroundColor: colors.onSurface.withOpacity(0.12),
                  ),
                  isSelected: !(wm.chirk.liked ?? true),
                  onPressed: () {
                    print(wm.chirk.liked);
                    wm.onTapDislike();
                    print(wm.chirk.liked);
                    //todo реализвать нажатие кнопки dislike
                  },
                  icon: const Icon(
                    Icons.thumb_down,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
