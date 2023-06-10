import 'package:dio/dio.dart';
import 'package:elementary/elementary.dart';

import '../../entity/user.dart';
import '../../service/config.dart';
import '../../service/managers.dart';

class EditPersonalInformationModel extends ElementaryModel {
  final _dio = Dio();
  User oldUser;

  EditPersonalInformationModel(this.oldUser) {
    _dio.options = BaseOptions(
      baseUrl: Config.apiURL,
      connectTimeout: const Duration(milliseconds: 60000),
      receiveTimeout: const Duration(milliseconds: 30000),
    );
  }

  Future<void> editInf(firstname, lastname) async {
    postHttp(firstname, lastname);
  }

  Future<int?> postHttp(firstname, lastname) async {
    final token = await TokenManager.getAccessToken();
    try {
      _dio.post(Config.editPersonalInformation,
          options: Options(
              headers:
                  token != null ? {'Authorization': 'Bearer $token'} : null),
          data: {"firstname": firstname, "lastname": lastname});
    } catch (e) {
      if (e is DioError) {
        return e.response?.statusCode;
      }
    }
    return null;
  }
}
