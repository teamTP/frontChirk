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
      connectTimeout: const Duration(milliseconds: 60000),
      receiveTimeout: const Duration(milliseconds: 30000),
    );
  }
  bool get isHiddenPassword => _isHiddenPassword;

  set isHiddenPassword(bool value) {
    _isHiddenPassword = value;
  }

  EntityStateNotifier<User> get userState => _userState;
  Future<String?> signUp(User user)async{
    if(await postHttp(user)==403){
      return "Пользователь с этим логином уже существует";
    }
  }

  set userState(EntityStateNotifier<User> value) {
    _userState = value;
  }

  Future<int?> postHttp(User user) async {
    Response response;

    print(user.toRegisterJson());

    try {
      response=await  _dio.post(Config.userRegister, data: user.toRegisterJson(), );
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
