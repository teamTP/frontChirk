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

class ChirkServiceDIO implements IChirkService{
  final dio = Dio();
  Chirk _chirk;

  ChirkServiceDIO(this._chirk);

  Chirk get chirk => _chirk;

  set chirk(Chirk value) {
    _chirk = value;
    //getHttp();
    postHttp2();
  }
  void getHttp() async {
    try{
      BaseOptions options = BaseOptions(
        baseUrl: "http://10.0.2.2:8080",
        connectTimeout: Duration(milliseconds: 60000),
        receiveTimeout: Duration(milliseconds: 30000),
      );
      Dio dio = Dio(options);
      var  response = await dio.get("/user/hello");
      print(response.data.toString());
    }catch(e){
      print(e);
    }
  }
  Future<void> postHttp() async {
    Response response;
    /*BaseOptions options = BaseOptions(
      baseUrl: "http://localhost:8080/",
      connectTimeout: Duration(milliseconds: 60000),
      receiveTimeout: Duration(milliseconds: 30000),
    );*/
    Dio dio = Dio();

    FormData formData = FormData.fromMap(
      _chirk.toRegJson(),
    );

    try {
      response = await dio.post("http://10.0.2.2:8080/user/register");
      if (response.statusCode == 200) {
        // Обработка успешного ответа
        var data = response.data;
        print(data);
      } else {
        // Обработка ошибки
        print('Error1: ${response.statusCode}');
      }
    } catch (e) {
      if (e is DioError) {
        // Обработка ошибки Dio
        if (e.response != null) {
          print('Error Response: ${e.response!.data}');
          print('Error Status Code: ${e.response!.statusCode}');
        } else {
          print('Error1: ${e.message}');
        }
      } else {
        // Обработка других исключений
        print('Error: $e');
      }
    }
  }
  Future<Null> postHttp2() async {
    Response response;
    BaseOptions options = BaseOptions(
      baseUrl: "http://10.0.2.2:8080",
      connectTimeout: Duration(milliseconds: 60000),
      receiveTimeout: Duration(milliseconds: 30000),
    );
    Dio dio = Dio(options);

    FormData formData = FormData.fromMap(
      _chirk.toLikeJson(),
    );
    print(_chirk.toLikeJson());

    try {
      response=await  dio.post("/estimate/add", data: _chirk.toLikeJson(), );
    } catch (e) {
      print('Error: $e');
    }
  }
}
