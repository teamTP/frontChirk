
import 'package:chirk/service/managers.dart';
import 'package:dio/dio.dart';
import 'package:elementary/elementary.dart';

import '../../entity/chirk.dart';
import '../../service/chirl_list_service.dart';
import '../../service/config.dart';

class ChirkListModelDIO extends ChirkListModel {
  int page = 0;
  final dio = Dio();
  List<Chirk> _chirkList = [];
  final ChirkListType _chirkListType;
  bool _isLoading = false;

  ChirkListModelDIO(this._chirkListType) {
    page = 0;
    dio.options = BaseOptions(
      baseUrl: Config.apiURL,
      connectTimeout: const Duration(milliseconds: 60000),
      receiveTimeout: const Duration(milliseconds: 30000),
    );
    getHttp().then((list) {
      _chirkList = list;
      chirkState.content(_chirkList);
    });
  }

  @override
  Future<void> pagination() async {
    if (!_isLoading) {
      _isLoading = true;
      page++;
      _chirkList.addAll(await getHttp());
      _isLoading = false;
    }
    chirkState.content(_chirkList);
  }

  @override
  void update() {
    page = 0;
    _chirkList.clear();
    getHttp().then((list) {
      _chirkList = list;
      chirkState.content(_chirkList);
    });
  }

  Future<List<Chirk>> getHttp() async {
    final token = await TokenManager.getAccessToken();
    final response = await dio.get(_chirkListType.value,
        queryParameters: {'page': page},
        options: Options(
            headers:
                token != null ? {'Authorization': 'Bearer $token'} : null));
    return response.data.map<Chirk>((chirk) => Chirk.fromJson(chirk)).toList();
    }

  @override
  // TODO: implement isLoading
  get isLoading => _isLoading;
}

abstract class ChirkListModel extends ElementaryModel {
  final EntityStateNotifier<List<Chirk>> chirkState = EntityStateNotifier();

  get isLoading;

  Future<void> pagination();

  void update();
}

class ChirkListModelList extends ChirkListModel {
  bool _isLoading = false;
  final IChirkListService _chirkListService;

  ChirkListModelList(this._chirkListService) {
    chirkState.content(_chirkListService.chirks);
  }

  @override
  Future<void> pagination() async {
    if(!_isLoading){
      _isLoading = true;
      _chirkListService.pagination();
      _isLoading = false;
    }
    chirkState.content(_chirkListService.chirks);
  }

  @override
  void update() {
    _chirkListService.update();
    chirkState.content(_chirkListService.chirks);
  }

  @override
  // TODO: implement isLoading
  get isLoading => _isLoading;
}

enum ChirkListType {
  standard,
  myList,
  liked,
  disliked,
}

extension ChirkListTypeExtension on ChirkListType {
  String get value {
    switch (this) {
      case ChirkListType.standard:
        return '/feed';
      case ChirkListType.myList:
        return '/profile/myChirks';
      case ChirkListType.liked:
        return '/profile/myLikedChirks';
      case ChirkListType.disliked:
        return '/profile/myDislikedChirks';
    }
  }
}
