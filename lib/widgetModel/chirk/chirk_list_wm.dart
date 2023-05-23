import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';

import 'package:chirk/entity/chirk.dart';
import 'package:chirk/model/chirk/chirk_list_model.dart';
import 'package:chirk/widget/chirk/chirk_list_widget.dart';

class ChirkListWM extends WidgetModel<ChirkListWidget, ChirkListModel>
    implements IChirkListWM {
  final scrollController = ScrollController();
  ChirkListWM(ChirkListModel model) : super(model);

  @override
  void initWidgetModel() {
    super.initWidgetModel();

    scrollController.addListener(() {
      if (!isLoading && scrollController.position.maxScrollExtent ==
          scrollController.offset) {
        fetch();
      }
    });
  }

  @override
  EntityStateNotifier<List<Chirk>> get chirksState => model.chirkState;

  @override
  void dispose() {
    chirksState.dispose();
    super.dispose();
  }

  Future fetch() async {
    await model.pagination();
  }

  @override
  get controller => scrollController;

  @override
  void update() {
    model.update();
  }

  @override
  // TODO: implement isLoading
  bool get isLoading => model.isLoading;
}

abstract class IChirkListWM extends IWidgetModel {
  EntityStateNotifier<List<Chirk>> get chirksState;

  get controller;

  bool get isLoading;

  void update();

}
