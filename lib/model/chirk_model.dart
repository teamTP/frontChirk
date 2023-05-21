import 'package:chirk/config.dart';
import 'package:dio/dio.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';

import '../entity/chirk.dart';

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

  void postHttp() async {
    Response response;
    BaseOptions options = BaseOptions(
      baseUrl: ConfigAPI.apiURL,
      connectTimeout: Duration(milliseconds: 60000),
      receiveTimeout: Duration(milliseconds: 30000),
    );
    Dio dio = Dio(options);

    FormData formData = FormData.fromMap(
      _chirk.toLikeJson(),
    );
    print(_chirk.toLikeJson());

    try {
      response = await dio.post(
        "/estimate/add",
        data: _chirk.toLikeJson(),
      );
    } catch (e) {
      print('Error: $e');
    }
  }
}
