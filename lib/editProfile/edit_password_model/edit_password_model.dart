import 'package:chirk/service/config.dart';
import 'package:chirk/service/managers.dart';
import 'package:dio/dio.dart';
import 'package:elementary/elementary.dart';

class EditPasswordModel extends ElementaryModel{
  final _dio = Dio();

  EditPasswordModel(){
    _dio.options = BaseOptions(
      baseUrl: Config.apiURL,
      connectTimeout: const Duration(milliseconds: 60000),
      receiveTimeout: const Duration(milliseconds: 30000),
    );
  }
  Future<void> editPas() async{
    postHttp();
  }

  Future<void> postHttp() async {
    final token = await TokenManager.getAccessToken();
    Response response;
    try {
      response = await _dio.post(
        Config.editPassword,
        options: Options(
            headers: token != null ? {'Authorization': 'Bearer $token'} : null),
      );
    } catch (e) {
      print('Error: $e');
    }
  }

}