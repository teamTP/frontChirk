import 'package:chirk/service/config.dart';
import 'package:dio/dio.dart';
import 'package:elementary/elementary.dart';

import '../../entity/chirk.dart';
import '../../service/managers.dart';

class ChirkModel extends ElementaryModel {
  final IChirkService _chirkService;
  final EntityStateNotifier<Chirk> chirkState = EntityStateNotifier();

  ChirkModel(this._chirkService) {
    chirkState.content(_chirkService.chirk);
  }

  void update(Chirk newChirk) {
    chirkState.content(newChirk);
    _chirkService.chirk = newChirk;
  }

  Future<void> delete() async {
    _chirkService.delete();
  }
}

abstract class IChirkService {
  Chirk get chirk;

  set chirk(Chirk value);

  void delete();
}

class ChirkService implements IChirkService {
  Chirk _chirk;

  ChirkService(this._chirk);

  @override
  Chirk get chirk => _chirk;

  @override
  set chirk(Chirk value) {
    _chirk = value;
  }

  @override
  void delete() {
    // TODO: implement delete
  }
}

class ChirkServiceDIO implements IChirkService {
  final dio = Dio();
  Chirk _chirk;

  ChirkServiceDIO(this._chirk);

  @override
  Chirk get chirk => _chirk;

  @override
  set chirk(Chirk value) {
    _chirk = value;
    postHttp();
  }

  @override
  void delete() {
    deleteHttp();
  }

  Future<void> postHttp() async {
    final token = await TokenManager.getAccessToken();
    Response response;
    BaseOptions options = BaseOptions(
      baseUrl: Config.apiURL,
      connectTimeout: Duration(milliseconds: 60000),
      receiveTimeout: Duration(milliseconds: 30000),
    );
    Dio dio = Dio(options);
    try {
      response = await dio.post(
        Config.estimateAdd,
        options: Options(
            headers: token != null ? {'Authorization': 'Bearer $token'} : null),
        data: _chirk.toLikeJson(),
      );
    } catch (e) {
      print('Error: $e');
    }
  }
  Future<void> deleteHttp() async {
    final token = await TokenManager.getAccessToken();
    Response response;
    BaseOptions options = BaseOptions(
      baseUrl: Config.apiURL,
      connectTimeout: Duration(milliseconds: 60000),
      receiveTimeout: Duration(milliseconds: 30000),
    );
    Dio dio = Dio(options);
    try {
      response = await dio.delete(
        Config.chirksDelete,
        options: Options(
            headers: token != null ? {'Authorization': 'Bearer $token'} : null),
        data: {
          "id": _chirk.id
        },
      );
    } catch (e) {
      print('Error: $e');
    }
  }
}
