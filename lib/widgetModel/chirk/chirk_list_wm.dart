import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';

import 'package:chirk/entity/chirk.dart';
import 'package:chirk/model/chirk/chirk_list_model.dart';
import 'package:chirk/widget/chirk/chirk_list_widget.dart';

class ChirkListWM extends WidgetModel<ChirkListWidget, ChirkListModel>
    implements IChirkListWM {
  final scrollController = ScrollController();

  ChirkListWM(super.model);


  @override
  Future<void> initWidgetModel() async {
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
    super.dispose();
  }

  Future<void> fetch() async {
    model.pagination();
  }
  @override
  get controller => scrollController;

  @override
  Future<void> update() async {
    model.update();
  }

  @override
  bool get isLoading => model.isLoading;

  @override
  EntityStateNotifier<List<Chirk>> get chirksState => model.chirkListState;
}

abstract class IChirkListWM extends IWidgetModel {
  EntityStateNotifier<List<Chirk>> get chirksState;

  get controller;

  bool get isLoading;

  void update();

}
