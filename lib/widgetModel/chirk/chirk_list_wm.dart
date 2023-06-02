import 'package:chirk/service/config.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';

import 'package:chirk/entity/chirk.dart';
import 'package:chirk/model/chirk/chirk_list_model.dart';
import 'package:chirk/widget/chirk/chirk_list_widget.dart';

import '../../service/managers.dart';

class ChirkListWM extends WidgetModel<ChirkListWidget, ChirkListModel>
    implements IChirkListWM {
  final scrollController = ScrollController();
  bool _isModerator=false;

  ChirkListWM(super.model);


  @override
  Future<void> initWidgetModel() async {
    super.initWidgetModel();

    _isModerator =await TokenManager.isModerator();
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

  @override
  bool get isModerator => _isModerator;

  @override
  ChirkListType get listType => model.chirkListType;
}

abstract class IChirkListWM extends IWidgetModel {
  EntityStateNotifier<List<Chirk>> get chirksState;

  get controller;

  bool get isLoading;

  bool get isModerator;

  ChirkListType get listType;

  void update();

}
