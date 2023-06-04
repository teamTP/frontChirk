import 'package:chirk/service/managers.dart';
import 'package:dio/dio.dart';
import 'package:elementary/elementary.dart';

import '../../entity/chirk.dart';
import '../../service/config.dart';

class ChirkListModelDIO extends ChirkListModel {
  final dio = Dio();
  int page = 0;
  List<Chirk> _chirkList = [];
  final ChirkListType _chirkListType;
  bool _isLoading = false;
  final EntityStateNotifier<List<Chirk>> _chirkListState =
      EntityStateNotifier();

  ChirkListModelDIO(this._chirkListType) {
    page = 0;
    dio.options = BaseOptions(
      baseUrl: Config.apiURL,
      connectTimeout: const Duration(milliseconds: 60000),
      receiveTimeout: const Duration(milliseconds: 30000),
    );
    getHttp().then((list) {
      _chirkList = list;
      _chirkListState.content(_chirkList);
    });
  }

  @override
  Future<void> pagination() async {
    if (!_isLoading) {
      _isLoading = true;
      page++;
      _chirkList.addAll(await getHttp());
      _isLoading = false;
      _chirkListState.content(_chirkList);
    }
  }

  @override
  Future<void> update() async {
    page = 0;
    _chirkList.clear();
    getHttp().then((list) {
      _chirkList = list;
      _chirkListState.content(_chirkList);
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
  get isLoading => _isLoading;

  @override
  List<Chirk> get chirkList => _chirkList;

  @override
  EntityStateNotifier<List<Chirk>> get chirkListState => _chirkListState;

  @override
  get chirkListType => _chirkListType;
}

abstract class ChirkListModel extends ElementaryModel {
  get isLoading;

  get chirkListType;

  Future<void> pagination();

  Future<void> update();

  List<Chirk> get chirkList;

  EntityStateNotifier<List<Chirk>> get chirkListState;
}
