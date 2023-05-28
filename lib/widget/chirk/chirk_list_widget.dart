import 'package:chirk/model/chirk/chirk_model.dart';
import 'package:chirk/widget/chirk/chirk_widget.dart';
import 'package:chirk/widgetModel/chirk/chirk_wm.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';

import '../../widgetModel/chirk/chirk_list_wm.dart';

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
        builder: (context, chirkList) {
          if (chirkList == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          chirkList.sort((a, b)=> a.dateTime.compareTo(b.dateTime));
          return RefreshIndicator(
            child: ListView.builder(
              controller: wm.controller,
              itemCount: chirkList.length + 1,
              itemBuilder: (BuildContext context, int index) {
                if(chirkList.isEmpty){
                  return Center(
                    child: Column(children: [
                      Text('Попробуйте перезагрузить ленту'),
                      ElevatedButton(onPressed: () =>wm.update(), child: Text('Перезагрузить'))
                    ],),
                  );

                }
                if (index == chirkList.length) {
                  return _buildLoaderIndicator(wm.isLoading);
                } else {
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

