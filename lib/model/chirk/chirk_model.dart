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

  Future<Chirk>updateVisible() async{
    await _chirkService.updateVisible();
    chirkState.content(_chirkService.chirk);
    return _chirkService.chirk;
  }

}

abstract class IChirkService {
  Chirk get chirk;

  set chirk(Chirk value);

  void delete();

  Future<void> updateVisible();
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

  @override
  Future<void> updateVisible() async{
    // TODO: implement updateVisible
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
  @override
  Future<void> updateVisible() async {
    await putHttp();
    _chirk.visible = !_chirk.visible;
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
  Future<void> putHttp() async {
    final token = await TokenManager.getAccessToken();
    Response response;
    BaseOptions options = BaseOptions(
      baseUrl: Config.apiURL,
      connectTimeout: Duration(milliseconds: 60000),
      receiveTimeout: Duration(milliseconds: 30000),
    );
    Dio dio = Dio(options);
    try {
      response = await dio.put(
        Config.chirksUpdateVisible,
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
