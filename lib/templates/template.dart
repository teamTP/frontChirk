import 'dart:math';

import 'package:chirk/models/chirkMessage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';

class TemplateActivity extends StatefulWidget {
  String _title;
  Widget _bodyWidget;

  TemplateActivity(this._title, this._bodyWidget);

  @override
  State<StatefulWidget> createState() => _FeedState(_title, _bodyWidget);
}

class _FeedState extends State<StatefulWidget> {
  String _title;
  Widget _bodyWidget;

  _FeedState(this._title, this._bodyWidget);

  @override
  Widget build(BuildContext context) {
    return standardNavigation(context, _title, _bodyWidget);
  }

  Widget standardNavigation(BuildContext context, String title, Widget body) {
    return Scaffold(
      appBar: AppBar(
        title: Title(
          color: Colors.black,
          child: Text(title),
        ),
      ),
      body: body,
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.list), label: "Лента чирков"),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: "Создать чирк"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Профиль"),
        ],
      ),
    );
  }
}
