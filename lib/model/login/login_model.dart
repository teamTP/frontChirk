import 'package:chirk/service/managers.dart';
import 'package:dio/dio.dart';
import 'package:elementary/elementary.dart';

import '../../entity/user.dart';
import '../../service/config.dart';

class LoginModel extends ElementaryModel {
  final _dio = Dio();
  bool _isHiddenPassword = true;
  EntityStateNotifier<User> _userState = EntityStateNotifier();


  LoginModel() {
    _dio.options = BaseOptions(
      baseUrl: Config.apiURL,
    );
  }

  bool get isHiddenPassword => _isHiddenPassword;

  set isHiddenPassword(bool value) {
    _isHiddenPassword = value;
  }

  EntityStateNotifier<User> get userState => _userState;
  set userState(EntityStateNotifier<User> value) {
    _userState = value;
  }
  Future<String?> logIn(User user)async{
    int? value = await postHttp(user);
    if(value==403){
      return "Вы ввели неверный логин или пароль";
    }
  }

  Future<int?> postHttp(User user) async {
    Response response;

    print(user.toRegisterJson());

    try {
      response=await  _dio.post(Config.userAuthorisation, data: user.toRegisterJson(), );
      final accessToken = response.data['accessToken'];
      final refreshToken = response.data['refreshToken'];
      TokenManager.saveTokens(accessToken, refreshToken);
    } catch (e) {
      if(e is DioError){
        return e.response?.statusCode;
      }
    }
  }
}