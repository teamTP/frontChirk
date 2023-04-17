import 'package:chirk/templates/bodyTemplates/chirk_widget.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import '../../models/chirk.dart';

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
      body: ListView.builder(
        itemCount: widget._chirkList.length,
        itemBuilder: (BuildContext context, int index) {
          return ChirkWidget(widget._chirkList[index]);
        },
      ),
    );
  }
}

