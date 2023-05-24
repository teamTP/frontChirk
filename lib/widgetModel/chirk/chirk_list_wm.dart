import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';

import 'package:chirk/entity/chirk.dart';
import 'package:chirk/model/chirk/chirk_list_model.dart';
import 'package:chirk/widget/chirk/chirk_list_widget.dart';

class ChirkListWM extends WidgetModel<ChirkListWidget, ChirkListModel>
    implements IChirkListWM {
  final scrollController = ScrollController();
  final EntityStateNotifier<List<Chirk>> _chirkListState = EntityStateNotifier();
  ChirkListWM(super.model);

  @override
  void initWidgetModel() {
    super.initWidgetModel();

    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.offset) {
        fetch();
      }
    });
  }


  @override
  void dispose() {
    chirksState.dispose();
    super.dispose();
  }

  Future<void> fetch() async {
    await model.pagination().then((value) => _chirkListState.content(model.chirkList));

  }

  @override
  get controller => scrollController;

  @override
  Future<void> update() async{
    model.update().then((value) => _chirkListState.content(model.chirkList));

  }

  @override
  bool get isLoading => model.isLoading;

  @override
  EntityStateNotifier<List<Chirk>> get chirksState => _chirkListState;
}

abstract class IChirkListWM extends IWidgetModel {
  EntityStateNotifier<List<Chirk>> get chirksState;

  get controller;

  bool get isLoading;

  void update();

}
