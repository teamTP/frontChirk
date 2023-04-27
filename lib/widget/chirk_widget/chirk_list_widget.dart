import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';

import '../../widgetModel/chirk_list_wm.dart';
import 'chirk_widget.dart';

class ChirkListWidget extends ElementaryWidget<IChirkListWM>{
  ChirkListWidget(super.wmFactory);
  TextEditingController My_controller = new TextEditingController();


  @override
  Widget build(IChirkListWM wm) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Лента чирков"),
      ),
      body: ListView.builder(
        itemCount: wm.chirks.value.length,
        itemBuilder: (BuildContext context, int index) {
          return ChirkWidget(wm.chirks.value[index]);
        },
      ),
    );
  }

}