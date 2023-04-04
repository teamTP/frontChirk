import 'package:chirk/activities/new%20test/interfaceTemplate.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class AbstractStandardState extends State<StatefulWidget> implements InterfaceTemplate{

  @override
  String title;
  AbstractStandardState(this.title);

  @override
  Widget build(BuildContext context) {
    return standardNavigation(context, title);
  }
  Widget standardNavigation(BuildContext context, String title) {
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
          BottomNavigationBarItem(icon: Icon(Icons.list), label: "Лента чирков"),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: "Создать чирк"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Профиль"),
        ],
      ),
    );
  }
}