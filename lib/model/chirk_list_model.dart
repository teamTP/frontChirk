import 'dart:io';

import 'package:dio/dio.dart';
import 'package:elementary/elementary.dart';

import '../entity/chirk.dart';
import '../entity/user.dart';
import '../service/chirl_list_service.dart';

class ChirkListModelDIO extends ChirkListModel{
  int page = 0;
  final dio = Dio();
  List<Chirk> _chirkList =[];
  final EntityStateNotifier<List<Chirk>> chirkList = EntityStateNotifier();
  ChirkListType _chirkListType;

  ChirkListModelDIO(this._chirkListType) {
    page = 0;
    dio.options = BaseOptions(
      baseUrl: "http://10.0.2.2:8080",
      connectTimeout: Duration(milliseconds: 60000),
      receiveTimeout: Duration(milliseconds: 30000),
    );
    getHttp().then((list) {
      _chirkList = list;
      chirkList.content(_chirkList);
    });
  }
  @override
  void pagination() {
    page++;
    getHttp().then((list) {
      _chirkList.addAll(list);
      chirkList.content(_chirkList);
    });
  }

  @override
  void update() {
    page = 0;
    _chirkList.clear();
    getHttp().then((list) {
      _chirkList = list;
      chirkList.content(_chirkList);
    });
  }

  Future<List<Chirk>> getHttp() async {
    final response = await dio.get(_chirkListType.value,
        data: User(
            id: 1,
            login: '',
            password: '',
            iconId: 1,
            name: '',
            surname: '')
            .toFeedJson(page));
    return response.data.map<Chirk>((chirk) => Chirk.fromJson(chirk)).toList();
    _chirkList.addAll(
        response.data.map<Chirk>((chirk) => Chirk.fromJson(chirk)).toList());
  }



}
abstract class ChirkListModel extends ElementaryModel{
  final EntityStateNotifier<List<Chirk>> chirkList = EntityStateNotifier();
  void pagination();
  void update();
}

class ChirkListModelList extends ChirkListModel{
  final IChirkListService _chirkListService;
  final EntityStateNotifier<List<Chirk>> chirkList = EntityStateNotifier();

  ChirkListModelList(this._chirkListService){
    chirkList.content(_chirkListService.chirks);
  }

  void pagination(){
    _chirkListService.pagination();
    chirkList.content(_chirkListService.chirks);
  }

  void update() {
    _chirkListService.update();
    chirkList.content(_chirkListService.chirks);
  }



}

enum ChirkListType {
  standard,
  myList,
  liked,
  disliked,
}

extension ChirkListTypeExtension on ChirkListType {
  //todo сделать когда будет
  String get value {
    switch (this) {
      case ChirkListType.standard:
        return '/feed';
      case ChirkListType.myList:
        return '/myChirks';
      case ChirkListType.liked:
        return '/feed';
      case ChirkListType.disliked:
        return '/feed';
    }
  }
}