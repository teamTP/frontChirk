

import 'package:chirk/widget/unlogin/log_out_widget_body.dart';
import 'package:flutter/material.dart';

class LogOutAddChirkWidget extends StatefulWidget {
  const LogOutAddChirkWidget({Key? key}) : super(key: key);

  @override
  State<LogOutAddChirkWidget> createState() => _LogOutAddChirkWidgetState();
}

class _LogOutAddChirkWidgetState extends State<LogOutAddChirkWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Title(
          color: Colors.black,
          child: const Text("Чиркнуть"),
        ),
      ),
      body: const LogOutWidget("Вы хотите чиркнуть?"),
    );
  }
}