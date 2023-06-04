import 'package:chirk/service/managers.dart';
import 'package:dio/dio.dart';
import 'package:elementary/elementary.dart';

import '../../entity/user.dart';
import '../../service/config.dart';

class LoginModel extends ElementaryModel {
  final _dio = Dio();
  bool isHiddenPassword = true;
  EntityStateNotifier<User> userState = EntityStateNotifier();

  LoginModel() {
    _dio.options = BaseOptions(
      baseUrl: Config.apiURL,
    );
  }

  Future<String?> logIn(User user) async {
    if (await postHttp(user) == 403) {
      return "Неверный логин или пароль";
    }
    return null;
  }

  Future<int?> postHttp(User user) async {
    Response response;
    try {
      response = await _dio.post(
        Config.userAuthorisation,
        data: user.toRegisterJson(),
      );
      final accessToken = response.data['accessToken'];
      final refreshToken = response.data['refreshToken'];
      TokenManager.saveTokens(accessToken, refreshToken);
    } catch (e) {
      if (e is DioError) {
        return e.response!.statusCode;
      }
    }
    return null;
  }
}
