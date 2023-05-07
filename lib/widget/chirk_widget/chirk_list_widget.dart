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
      body: EntityStateNotifierBuilder(
        listenableEntityState: wm.chirksState,
        builder: (context, chirks) {
          if (chirks == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return RefreshIndicator(
              child: ListView.builder(
                controller: wm.controller,
                itemCount: chirks.length + 1,
                itemBuilder: (BuildContext context, int index) {
                  if (index < chirks.length) {
                    return ChirkWidgetEl((context) =>
                        ChirkWM(ChirkModel(ChirkService(chirks[index]))));
                  } else {
                    return const Padding(
                      padding: EdgeInsets.symmetric(vertical: 32),
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                  //return ChirkWidget(wm.chirks.value[index]);
                },
              ),
              onRefresh: () async => wm.update(),
          );
        },
      ),
    );
  }
}
