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
  Future<void> addChirk(String message)async {
    postHttp(message);
  }

  Future<void> postHttp(String message ) async{
    final token = await TokenManager.getAccessToken();

    try {
      final response=await  _dio.post("/chirks/add",
        data: Chirk.toAddJson(isDisappear, message),
        options: Options(
            headers: token != null ? {'Authorization': 'Bearer $token'} : null),
      );

    } catch (e) {
      print('Error: $e');
    }
  }
}
