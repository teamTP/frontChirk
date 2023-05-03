import 'package:elementary/elementary.dart';
import 'package:flutter/cupertino.dart';

import '../entity/chirk.dart';
import '../service/chirl_list_service.dart';

class ChirkListModel extends ElementaryModel{
  final IChirkListService _chirkListService;
  final EntityStateNotifier<List<Chirk>> chirkList = EntityStateNotifier();

  ChirkListModel(this._chirkListService){
   chirkList.content(_chirkListService.chirks);
  }

  void pagination(){
    _chirkListService.pagination();
    chirkList.content(_chirkListService.chirks);
  }



}