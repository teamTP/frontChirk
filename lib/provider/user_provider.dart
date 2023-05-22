import 'package:chirk/service/managers.dart';
import 'package:flutter/foundation.dart';

import '../entity/user.dart';

class UserProvider with ChangeNotifier {
  UserRepository _userRepository = UserRepository();

  Future<User?> get user => _userRepository.getUser();

  void setUser(User newUser) {
    _userRepository.saveUser(newUser);
    notifyListeners();
  }
  void deleteUser(){
    _userRepository.deleteUser();
    notifyListeners();
  }
}
class TokenProvider with ChangeNotifier {

  Future<String?> get accessToken => TokenManager.getAccessToken();
  Future<String?> get refreshToken => TokenManager.getRefreshToken();

  void setTokens(String accessToken, String refreshToken) {
    TokenManager.saveTokens(accessToken, refreshToken);
    notifyListeners();
  }
  void deleteTokens(){
    TokenManager.removeTokens();
    notifyListeners();
  }
}