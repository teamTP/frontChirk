import 'package:dio/dio.dart';
import 'package:elementary/elementary.dart';

import '../../entity/user.dart';
import '../../service/config.dart';
import '../../service/managers.dart';

class SignUpModel extends ElementaryModel {
  final _dio = Dio();
  bool isHiddenPassword = true;
  EntityStateNotifier<User> userState = EntityStateNotifier();

  SignUpModel() {
    _dio.options = BaseOptions(
      baseUrl: Config.apiURL,
      connectTimeout: const Duration(milliseconds: 60000),
      receiveTimeout: const Duration(milliseconds: 30000),
    );
  }

  Future<String?> signUp(User user) async {
    if (await postHttp(user) == 403) {
      return "Пользователь с этим логином уже существует";
    }
    return null;
  }

  Future<int?> postHttp(User user) async {
    Response response;
    try {
      response = await _dio.post(
        Config.userRegister,
        data: user.toRegisterJson(),
      );
      final accessToken = response.data[Config.accessId];
      final refreshToken = response.data[Config.refreshId];
      TokenManager.saveTokens(accessToken, refreshToken);
    } catch (e) {
      if (e is DioError) {
        return e.response!.statusCode;
      }
    }
    return null;
  }
}
