import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';

import '../../entity/chirk.dart';
import '../../service/userIcons.dart';

class ChirkWidget extends StatefulWidget {
  Chirk chirk;

  ChirkWidget(this.chirk, {super.key});

  @override
  State<StatefulWidget> createState() => _ChirkWidgetState();
}

class _ChirkWidgetState extends State<ChirkWidget> {
  @override
  Widget build(BuildContext context) {
    ColorScheme colors = Theme.of(context).colorScheme;
    Jiffy.setLocale("ru");
    return Card(
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              radius: Theme.of(context).textTheme.headlineMedium!.fontSize!,
              backgroundImage: UserIcon.getImageById(widget.chirk.user.iconId),
            ),
            title:
                Text("${widget.chirk.user.surname} ${widget.chirk.user.name}"),
            subtitle:
                Text(Jiffy.parseFromDateTime(widget.chirk.dateTime).fromNow()),
            /*trailing: IconButton(
              onPressed: () {
                //todo реализовать нажатие и отображение кнопки delete
              },
              icon: const Icon(Icons.delete),
            ),*/
          ),
          Container(
            margin: const EdgeInsets.all(16),
            child: Text(widget.chirk.text),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 6, 6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  style: IconButton.styleFrom(
                    foregroundColor: (widget.chirk.liked ?? false)
                        ? colors.onPrimary
                        : colors.primary,
                    backgroundColor: (widget.chirk.liked ?? false)
                        ? colors.primary
                        : colors.surfaceVariant,
                    disabledForegroundColor: colors.onSurface.withOpacity(0.38),
                    disabledBackgroundColor: colors.onSurface.withOpacity(0.12),
                  ),
                  isSelected: widget.chirk.liked,
                  onPressed: () {
                    setState(() {
                      if (widget.chirk.liked ?? false){
                        widget.chirk.liked=null;
                      }else{
                        widget.chirk.liked = true;
                      }
                    });
                    //todo реализвать нажатие кнопки like
                  },
                  icon: const Icon(
                    Icons.thumb_up,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(6, 0, 0, 0),
                  child: Text("${widget.chirk.likeCount} : "),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 6, 0),
                  child: Text("${widget.chirk.disLikeCount}"),
                ),
                IconButton(
                  style: IconButton.styleFrom(
                    foregroundColor: !(widget.chirk.liked ?? true)
                        ? colors.onPrimary
                        : colors.primary,
                    backgroundColor: !(widget.chirk.liked ?? true)
                        ? colors.primary
                        : colors.surfaceVariant,
                    disabledForegroundColor: colors.onSurface.withOpacity(0.38),
                    disabledBackgroundColor: colors.onSurface.withOpacity(0.12),
                  ),
                  isSelected: !(widget.chirk.liked ?? true),
                  onPressed: () {
                    setState(() {
                      if (!(widget.chirk.liked ?? true)){
                        widget.chirk.liked=null;
                      }else{
                        widget.chirk.liked = false;
                      }
                    });
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
