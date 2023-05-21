

import 'package:chirk/widget/unlogin/unlogin_widget_body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UnloginAddChirkWidget extends StatefulWidget {
  const UnloginAddChirkWidget({Key? key}) : super(key: key);

  @override
  State<UnloginAddChirkWidget> createState() => _UnloginAddChirkWidgetState();
}

class _UnloginAddChirkWidgetState extends State<UnloginAddChirkWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Title(
          color: Colors.black,
          child: const Text("Чиркнуть"),
        ),
      ),
      body: UnloginWidget("Вы хотите чиркнуть?"),
    );
  }
}