import 'package:chirk/widgetModel/chirk/chirk_wm.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';

class ChirkWidget extends ElementaryWidget<IChirkWM> {
  const ChirkWidget(super.wmFactory, {super.key});

  @override
  Widget build(IChirkWM wm) {
    ColorScheme colors = wm.theme.colorScheme;
    Jiffy.setLocale("ru");
    return EntityStateNotifierBuilder(
        listenableEntityState: wm.deletedState,
        builder: (context, isDeleted) {
          return isDeleted ?? false
              ? SizedBox()
              : EntityStateNotifierBuilder(listenableEntityState: wm.chirkState, builder: (context, chirk){
            if(chirk==null){
              return CircularProgressIndicator();
            }else{
              return Opacity(
                opacity: chirk.visible ? 1.0 : 0.5,
                child: Card(
                  child: Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          radius:
                          wm.theme.textTheme.headlineMedium!.fontSize!,
                          backgroundImage: wm.getImage(),
                        ),
                        title: Text(
                            "${chirk.user.surname} ${chirk.user.name}"),
                        subtitle: Text(Jiffy.parseFromDateTime(
                            chirk.dateTime)
                            .fromNow()),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            wm.isModerator || wm.isVisibleEdit
                                ? IconButton(
                              style: IconButton.styleFrom(
                                foregroundColor: colors.primary,
                                backgroundColor: colors.surfaceVariant,
                                disabledForegroundColor:
                                colors.onSurface.withOpacity(0.38),
                                disabledBackgroundColor:
                                colors.onSurface.withOpacity(0.12),
                              ),
                              onPressed: () => wm.toTapDelete(),
                              icon: const Icon(Icons.delete),
                            )
                                : SizedBox(),
                            wm.isVisibleEdit
                                ? IconButton(
                              style: IconButton.styleFrom(
                                foregroundColor: colors.primary,
                                backgroundColor: colors.surfaceVariant,
                                disabledForegroundColor:
                                colors.onSurface.withOpacity(0.38),
                                disabledBackgroundColor:
                                colors.onSurface.withOpacity(0.12),
                              ),
                              onPressed: () =>wm.onTapVisibility(),
                              icon: Icon(chirk.visible
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                            )
                                : SizedBox(),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(16),
                        child: Text(chirk.text),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 6, 6),
                        child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
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
                                    },
                                    icon: const Icon(
                                      Icons.thumb_up,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                    const EdgeInsets.fromLTRB(6, 0, 0, 0),
                                    child: Text("${chirk.likeCount} : "),
                                  ),
                                  Padding(
                                    padding:
                                    const EdgeInsets.fromLTRB(0, 0, 6, 0),
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
                                      wm.onTapDislike();
                                      //todo реализвать нажатие кнопки dislike
                                    },
                                    icon: const Icon(
                                      Icons.thumb_down,
                                    ),
                                  ),
                                ]),
                        ),
                    ],
                  ),
                ),
              );
            }

          });
        });
  }
}
