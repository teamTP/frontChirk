import 'package:chirk/models/chirk.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/cupertino.dart';

import '../service/chirl_list_service.dart';

class ChirkListModel extends ElementaryModel{
  final IChirkListService _chirkListService;

  ChirkListModel(this._chirkListService){
   chirkList.value = _chirkListService.chirks;
  }
  final ValueNotifier<List<Chirk>> chirkList = ValueNotifier([]);


}