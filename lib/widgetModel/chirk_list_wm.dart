import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';

import '../entity/chirk.dart';
import '../model/chirk_list_model.dart';
import '../widget/chirk_widget/chirk_list_widget.dart';

class ChirkListWM extends WidgetModel<ChirkListWidget, ChirkListModel>
    implements IChirkListWM {
  final scrollController = ScrollController();

  ChirkListWM(ChirkListModel model) : super(model);

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
  EntityStateNotifier<List<Chirk>> get chirksState => model.chirkList;

  @override
  EntityStateNotifier<List<Chirk>> get chirksOnPagination =>
      throw UnimplementedError();

  @override
  void dispose() {
    chirksState.dispose();
    super.dispose();
  }

  Future fetch() async {
    model.pagination();
  }

  @override
  get controller => scrollController;

  @override
  void update() {
    model.update();
  }
}

abstract class IChirkListWM extends IWidgetModel {
  EntityStateNotifier<List<Chirk>> get chirksState;

  get controller;

  EntityStateNotifier<List<Chirk>> get chirksOnPagination;

  void update();
}
