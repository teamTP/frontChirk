import 'package:dio/dio.dart';
import 'package:elementary/elementary.dart';

import '../entity/user.dart';
import '../service/config.dart';
import '../service/managers.dart';

class EditPersonalInformationModel extends ElementaryModel{
  final _dio = Dio();
  User oldUser;

  EditPersonalInformationModel(this.oldUser){
    _dio.options = BaseOptions(
      baseUrl: Config.apiURL,
      connectTimeout: const Duration(milliseconds: 60000),
      receiveTimeout: const Duration(milliseconds: 30000),
    );
  }
  Future<void> editInf() async{
    postHttp();
  }

  Future<void> postHttp() async {
    final token = await TokenManager.getAccessToken();
    Response response;
    try {
      response = await _dio.post(
        Config.editPersonalInformation,
        options: Options(
            headers: token != null ? {'Authorization': 'Bearer $token'} : null),
      );
    } catch (e) {
      print('Error: $e');
    }
  }

}