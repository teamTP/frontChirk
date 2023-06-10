import 'package:dio/dio.dart';
import 'package:elementary/elementary.dart';

import '../../entity/user.dart';
import '../../service/config.dart';
import '../../service/managers.dart';

class ProfileModel extends ElementaryModel {
  final dio = Dio();
  User _user =
      User(id: 0, login: '', password: '', iconId: 0, name: '', surname: '');
  final EntityStateNotifier<User> userState = EntityStateNotifier();

  ProfileModel() {
    dio.options = BaseOptions(
      baseUrl: Config.apiURL,
      connectTimeout: const Duration(milliseconds: 60000),
      receiveTimeout: const Duration(milliseconds: 30000),
    );
    getHttp().then((value) {
      _user = value;
      userState.content(_user);
    });
  }

  Future<User> getHttp() async {
    final token = await TokenManager.getAccessToken();
    final response = await dio.get(
      Config.profileUserProfile,
      options: Options(
          headers: token != null ? {'Authorization': 'Bearer $token'} : null),
    );
    return User.fromJson(response.data);
  }
}
