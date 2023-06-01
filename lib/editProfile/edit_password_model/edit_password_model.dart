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
  Future<String?> editPas(oldPassword, newPassword) async{
    postHttp(oldPassword, newPassword).then((value){
      if(value == 403){
        return "Неверный пароль";
      }
    });
    return null;
  }

  Future<int?> postHttp(oldPassword, newPassword) async {
    final token = await TokenManager.getAccessToken();
    Response response;
    try {
      response = await _dio.post(
        Config.editPassword,
        options: Options(
            headers: token != null ? {'Authorization': 'Bearer $token'} : null),
        data: {
          "oldPassword": oldPassword,
          "newPassword": newPassword
        }
      );
    } catch (e) {
      if(e is DioError){
        return e.response?.statusCode;
      }
    }
    return null;
  }

}