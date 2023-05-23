import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class TokenManager {
  static const String _keyAccessToken = 'access_token';
  static const String _keyRefreshToken = 'refresh_token';

  static Future<void> saveTokens(String accessToken, String refreshToken) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyAccessToken, accessToken);
    await prefs.setString(_keyRefreshToken, refreshToken);
  }

  static Future<String?> getAccessToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyAccessToken);
  }

  static Future<String?> getRefreshToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyRefreshToken);
  }

  static Future<void> removeTokens() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_keyAccessToken);
    await prefs.remove(_keyRefreshToken);
  }

  String decryptToken(String encryptedToken, String secretKey) {
    final encryptedBytes = base64.decode(encryptedToken);
    final secretBytes = utf8.encode(secretKey);

    // Примените алгоритм расшифровки к зашифрованному токену, используя ваш ключ или секрет
    // В этом примере используется XOR-шифрование для демонстрации

    final decryptedBytes = List<int>.generate(encryptedBytes.length, (index) {
      return encryptedBytes[index] ^ secretBytes[index % secretBytes.length];
    });

    final decryptedToken = utf8.decode(decryptedBytes);
    return decryptedToken;
  }
}