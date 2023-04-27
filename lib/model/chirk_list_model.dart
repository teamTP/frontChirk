import 'package:elementary/elementary.dart';
import 'package:flutter/cupertino.dart';

import '../entity/chirk.dart';
import '../service/chirl_list_service.dart';

class ChirkListModel extends ElementaryModel{
  final IChirkListService _chirkListService;
  final ValueNotifier<List<Chirk>> chirkList = ValueNotifier([]);

  ChirkListModel(this._chirkListService){
   chirkList.value = _chirkListService.getChirks();
  }


}