import 'package:chirk/widget/unlogin/unlogin_widget_body.dart';
import 'package:flutter/material.dart';

class UnloginProfileWidget extends StatefulWidget {
  const UnloginProfileWidget({Key? key}) : super(key: key);

  @override
  State<UnloginProfileWidget> createState() => _UnloginProfileWidgetState();
}

class _UnloginProfileWidgetState extends State<UnloginProfileWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Title(
          color: Colors.black,
          child: const Text("Профиль"),
        ),
      ),
      body: UnloginWidget("Хотите войти?"),
    );
  }
}
