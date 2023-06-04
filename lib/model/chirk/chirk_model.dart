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

  Future<Chirk> updateVisible() async {
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

class ChirkServiceDIO implements IChirkService {
  final dio = Dio();
  Chirk _chirk;

  ChirkServiceDIO(this._chirk) {
    dio.options = BaseOptions(
      baseUrl: Config.apiURL,
      connectTimeout: const Duration(milliseconds: 60000),
      receiveTimeout: const Duration(milliseconds: 30000),
    );
  }

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

  Future<int?> postHttp() async {
    final token = await TokenManager.getAccessToken();
    try {
      await dio.post(
        Config.estimateAdd,
        options: Options(
            headers: token != null ? {'Authorization': 'Bearer $token'} : null),
        data: _chirk.toLikeJson(),
      );
    } catch (e) {
      if (e is DioError) {
        return e.response?.statusCode;
      }
    }
    return null;
  }

  Future<int?> deleteHttp() async {
    final token = await TokenManager.getAccessToken();
    try {
      await dio.delete(
        Config.chirksDelete,
        options: Options(
            headers: token != null ? {'Authorization': 'Bearer $token'} : null),
        data: {"id": _chirk.id},
      );
    } catch (e) {
      if (e is DioError) {
        return e.response?.statusCode;
      }
    }
    return null;
  }

  Future<int?> putHttp() async {
    final token = await TokenManager.getAccessToken();
    try {
      await dio.put(
        Config.chirksUpdateVisible,
        options: Options(
            headers: token != null ? {'Authorization': 'Bearer $token'} : null),
        data: {"id": _chirk.id},
      );
    } catch (e) {
      if (e is DioError) {
        return e.response?.statusCode;
      }
    }
    return null;
  }
}
