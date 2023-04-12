import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import '../../models/chirkMessage.dart';

class ChirkListWidget extends StatefulWidget {
  final List<Chirk> _chirkList;

  const ChirkListWidget(this._chirkList, {super.key});

  @override
  State<StatefulWidget> createState() => _ChirkListWidgetState();
}

class _ChirkListWidgetState extends State<ChirkListWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Лента чирков"),
      ),
      body: addCardList(),
    );
  }

  Widget addCardList() {
    return ListView.builder(
      itemCount: widget._chirkList.length,
      itemBuilder: (BuildContext context, int index) {
        return _chirkCard(context, widget._chirkList[index]);
      },
    );
  }

  Widget _chirkCard(BuildContext context, Chirk chirk) {
    Jiffy.setLocale("ru");
    return Card(
      child: Column(
        children: [
          ListTile(
            leading: const Icon(Icons.person_2_rounded),
            title: Text("${chirk.user.surname} ${chirk.user.name}"),
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
                ),
              ),
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
