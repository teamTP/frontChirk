import 'package:chirk/elementaryTest/model/chirk_list_model.dart';
import 'package:chirk/elementaryTest/widget/chirk_list_widget.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import '../../models/chirk.dart';

class ChirkListWM extends WidgetModel<ChirkListWidgetEl, ChirkListModel>
    implements IChirkListWM {

  ChirkListWM(ChirkListModel model) : super(model);

  @override
  void initWidgetModel() {
    super.initWidgetModel();
  }

  @override
  void onTabChirkDislike(Chirk chirk) {
    if(chirk.liked==null || !chirk.liked!){
      chirk.liked=true;
    }else{
      chirk.liked=null;
    }
    // TODO: implement onTabChirkDislike
  }

  @override
  void onTapChirkLike(Chirk chirk) {
    if(chirk.liked==null || chirk.liked!){
      chirk.liked=false;
    }else{
      chirk.liked=null;
    }
    // TODO: implement onTapChirkLike
  }

  @override
  ValueListenable<List<Chirk>> get chirks => model.chirkList;

  @override
  // TODO: implement chirksOnPagination
  ValueListenable<List<Chirk>> get chirksOnPagination => throw UnimplementedError();
}

abstract class IChirkListWM extends IWidgetModel {
  ValueListenable<List<Chirk>> get chirks;

  void onTapChirkLike(Chirk chirk);

  void onTabChirkDislike(Chirk chirk);

  ValueListenable<List<Chirk>> get chirksOnPagination;
}
