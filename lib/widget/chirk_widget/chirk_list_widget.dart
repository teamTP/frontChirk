import 'package:chirk/model/chirk_model.dart';
import 'package:chirk/widget/chirk_widget/chirk_widget_el.dart';
import 'package:chirk/widgetModel/chirk_wm.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';

import '../../widgetModel/chirk_list_wm.dart';
import 'chirk_widget.dart';

class ChirkListWidget extends ElementaryWidget<IChirkListWM> {
  final String _title;

  const ChirkListWidget(this._title, super.wmFactory, {super.key});

  @override
  Widget build(IChirkListWM wm) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: ListView.builder(
        itemCount: wm.chirks.value.length,
        itemBuilder: (BuildContext context, int index) {
          return ChirkWidgetEl((context) => ChirkWM(ChirkModel(ChirkService(wm.chirks.value[index]))));
          //return ChirkWidget(wm.chirks.value[index]);
        },
      ),
    );
  }
}
