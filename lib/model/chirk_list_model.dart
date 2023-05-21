import 'dart:io';

import 'package:chirk/config.dart';
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
      baseUrl: ConfigAPI.apiURL,
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
    try {
      final response = await dio.get(_chirkListType.value,
          data: User(
              id: 1,
              login: '',
              password: '',
              iconId: 1,
              name: '',
              surname: '')
              .toFeedJson(page));
      print(response.data);
      return response.data.map<Chirk>((chirk) => Chirk.fromJson(chirk))
          .toList();
    }catch(e){
      print("error: ${e}");
    }
    return [];
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

