import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';

import '../../entity/chirk.dart';


class ChirkWidget extends StatefulWidget{
  Chirk chirk;

  ChirkWidget(this.chirk, {super.key});

  @override
  State<StatefulWidget> createState() => _ChirkWidgetState();

}

class _ChirkWidgetState extends State<ChirkWidget> {
  @override
  Widget build(BuildContext context) {
    Jiffy.setLocale("ru");
    return Card(
      child: Column(
        children: [
          ListTile(
            leading: const Icon(Icons.person_2_rounded),
            title: Text("${widget.chirk.user.surname} ${widget.chirk.user.name}"),
            subtitle: Text(Jiffy.parseFromDateTime(widget.chirk.dateTime).fromNow()),
            trailing: IconButton(
              onPressed: () {
                //todo реализовать нажатие и отображение кнопки delete
              },
              icon: const Icon(Icons.delete),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(16),
            child: Text(widget.chirk.text),
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
                ),
              ),
              Text("${widget.chirk.likeCount} : "),
              Text("${widget.chirk.disLikeCount}"),
              IconButton(
                onPressed: () {
                  //todo реализвать нажатие кнопки dislike
                },
                icon: Icon(
                  Icons.thumb_down,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}