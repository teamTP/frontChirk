import 'package:chirk/service/config.dart';
import 'package:dio/dio.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';

import '../entity/chirk.dart';
import '../service/managers.dart';

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
}

abstract class IChirkService {
  Chirk get chirk;

  set chirk(Chirk value);
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
}

class ChirkServiceDIO implements IChirkService {
  final dio = Dio();
  Chirk _chirk;

  ChirkServiceDIO(this._chirk);

  Chirk get chirk => _chirk;

  set chirk(Chirk value) {
    _chirk = value;
    postHttp();
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
        "/estimate/add",
        options: Options(
            headers: token != null ? {'Authorization': 'Bearer $token'} : null),
        data: _chirk.toLikeJson(),
      );
    } catch (e) {
      print('Error: $e');
    }
  }
}
