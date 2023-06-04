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
          } else {
            //chirkList.sort((a, b)=> b.dateTime.compareTo(a.dateTime));
            return RefreshIndicator(
              onRefresh: wm.update,
              child: ListView.builder(
                controller: wm.controller,
                itemCount: chirkList.length + 1,
                itemBuilder: (BuildContext context, int index) {
                  if (index == chirkList.length) {
                    return FutureBuilder(
                        future: Future.delayed(const Duration(seconds: 3)),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Center(child: CircularProgressIndicator()),
                            );
                          } else {
                            if (chirkList.isNotEmpty) {
                              return const SizedBox();
                            } else {
                              return Center(
                                child: Column(
                                  children: [
                                    const Text(
                                        'Попробуйте перезагрузить ленту'),
                                    ElevatedButton(
                                      onPressed: () => wm.update(),
                                      child: const Text('Перезагрузить'),
                                    ),
                                  ],
                                ),
                              );
                            }
                          }
                        });
                  } else {
                    return ChirkWidget(
                      (context) => ChirkWM(
                          ChirkModel(ChirkServiceDIO(chirkList[index])),
                          wm.isModerator,
                          wm.listType),
                    );
                  }
                },
              ),
            );
          }
        },
      ),
    );
  }
}
