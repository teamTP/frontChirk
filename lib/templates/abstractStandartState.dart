import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'abstractBody.dart';

abstract class AbstractNavigationState extends State<StatefulWidget>
    implements AbstractBody {
  @override
  String title;

  AbstractNavigationState(this.title);

  @override
  Widget build(BuildContext context) {
    return navigationTemplate(context, title);
  }

  Widget navigationTemplate(BuildContext context, String title) {
    return Scaffold(
      appBar: AppBar(
        title: Title(
          color: Colors.black,
          child: Text(title),
        ),
      ),
      body: createBody(),
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
