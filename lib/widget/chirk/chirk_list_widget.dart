import 'package:chirk/model/chirk/chirk_model.dart';
import 'package:chirk/widget/chirk/chirk_widget.dart';
import 'package:chirk/widgetModel/chirk/chirk_wm.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';

import '../../widgetModel/chirk/chirk_list_wm.dart';

class ChirkListWidget extends ElementaryWidget<IChirkListWM> {
  final String _title;

  ChirkListWidget(this._title, super.wmFactory, {super.key});
  @override
  Widget build(IChirkListWM wm) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: EntityStateNotifierBuilder(
        listenableEntityState: wm.chirksState,
        builder: (context, chirkList) {
          if (chirkList == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return RefreshIndicator(
            child: ListView.builder(
              controller: wm.controller,
              itemCount: chirkList.length + 1,
              itemBuilder: (BuildContext context, int index) {
                if (index == chirkList.length) {
                  return _buildLoaderIndicator(wm.isLoading);
                } else {
                  print(index);
                  return ChirkWidget((context) =>
                      ChirkWM(ChirkModel(ChirkServiceDIO(chirkList[index]))));
                }
              },
            ),
            onRefresh: () async => wm.update(),
          );
        },
      ),
    );
  }
  Widget _buildLoaderIndicator(bool isLoading) {
    return isLoading
        ? const Padding(
      padding: EdgeInsets.all(8.0),
      child: Center(child: CircularProgressIndicator()),
    )
        : const SizedBox();
  }
}

