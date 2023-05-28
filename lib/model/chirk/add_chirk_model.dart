import 'package:dio/dio.dart';
import 'package:elementary/elementary.dart';

import '../../entity/chirk.dart';
import '../../service/config.dart';
import '../../service/managers.dart';

class AddChirkModel extends ElementaryModel {
  final _dio = Dio();
  bool isDisappear = false; //исчезнет

  AddChirkModel() {
    _dio.options = BaseOptions(
      baseUrl: Config.apiURL,
      connectTimeout: Duration(milliseconds: 60000),
      receiveTimeout: Duration(milliseconds: 30000),
    );
  }
  Future<String> addChirk(String message)async {
    return postHttp(message);
  }

  Future<String> postHttp(String message ) async{
    final token = await TokenManager.getAccessToken();

    try {
      final response=await  _dio.post(Config.chirksAdd,
        data: Chirk.toAddJson(isDisappear, message),
        options: Options(
            headers: token != null ? {'Authorization': 'Bearer $token'} : null),
      );

      return '';

    } catch (e) {
      return e.toString();
    }
  }
}
