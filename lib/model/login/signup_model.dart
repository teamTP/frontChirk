import 'package:dio/dio.dart';
import 'package:elementary/elementary.dart';

import '../../entity/user.dart';
import '../../service/config.dart';
import '../../service/managers.dart';

class SignUpModel extends ElementaryModel {
  final _dio = Dio();
  bool _isHiddenPassword = true;
  EntityStateNotifier<User> _userState = EntityStateNotifier();


  SignUpModel() {
    _dio.options = BaseOptions(
      baseUrl: Config.apiURL,
      connectTimeout: Duration(milliseconds: 60000),
      receiveTimeout: Duration(milliseconds: 30000),
    );
  }
  bool get isHiddenPassword => _isHiddenPassword;

  set isHiddenPassword(bool value) {
    _isHiddenPassword = value;
  }

  EntityStateNotifier<User> get userState => _userState;
  Future<void> signUp(User user)async{
    postHttp(user);
  }

  set userState(EntityStateNotifier<User> value) {
    _userState = value;
  }

  Future<void> postHttp(User user) async {
    Response response;

    print(user.toRegisterJson());

    try {
      response=await  _dio.post("/user/register", data: user.toRegisterJson(), );
      final accessToken = response.data['accessToken'];
      final refreshToken = response.data['refreshToken'];
      TokenManager.saveTokens(accessToken, refreshToken);
    } catch (e) {
      print('Error: $e');
    }
  }
}