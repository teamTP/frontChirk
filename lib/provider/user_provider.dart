import 'package:chirk/service/managers.dart';
import 'package:flutter/foundation.dart';
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