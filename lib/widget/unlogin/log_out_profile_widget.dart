import 'package:chirk/widget/unlogin/log_out_widget_body.dart';
import 'package:flutter/material.dart';

class LogOutProfileWidget extends StatefulWidget {
  const LogOutProfileWidget({Key? key}) : super(key: key);

  @override
  State<LogOutProfileWidget> createState() => _LogOutProfileWidgetState();
}

class _LogOutProfileWidgetState extends State<LogOutProfileWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Title(
          color: Colors.black,
          child: const Text("Профиль"),
        ),
      ),
      body: LogOutWidget("Хотите войти?"),
    );
  }
}
