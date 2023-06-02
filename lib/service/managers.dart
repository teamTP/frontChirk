import 'dart:convert';
import 'package:chirk/service/config.dart';
import 'package:dio/dio.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
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
    String? accessToken = prefs.getString(_keyAccessToken);

    if(accessToken!=null && isTokenExpired(accessToken)){
      return  refreshAccessToken();
    }
    return accessToken;

    return prefs.getString(_keyAccessToken);
  }

  static Future<String?> getRefreshToken() async {
    final prefs = await SharedPreferences.getInstance();
    String? refreshToken =  prefs.getString(_keyRefreshToken);

    if(refreshToken!=null && isTokenExpired(refreshToken)){
      await removeTokens();
      return  null;
    }
    return refreshToken;
  }

  static Future<void> removeTokens() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_keyAccessToken);
    await prefs.remove(_keyRefreshToken);
  }

  static bool isTokenExpired(String accessToken) {
    final Map<String, dynamic> decodedToken = JwtDecoder.decode(accessToken);
    final int expirationTime = decodedToken['exp'];
    final DateTime expirationDateTime = DateTime.fromMillisecondsSinceEpoch(expirationTime * 1000);
    final DateTime currentDateTime = DateTime.now();

    return currentDateTime.isAfter(expirationDateTime);
  }
  static Future<bool> isModerator() async{
    String? token = await getAccessToken();
    if(token == null){
      return false;
    }else{
      final Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
      //todo реализовать по готовности
      return List<String>.from(decodedToken['authorities']).contains('BAN_PUBLICATION_AUTHORITY');
    }
  }

  static Future<String?> refreshAccessToken()async {
    var dio = Dio();
    dio.options = BaseOptions(
      baseUrl: Config.apiURL,
      connectTimeout: Duration(milliseconds: 60000),
      receiveTimeout: Duration(milliseconds: 30000),
    );
    String? refToken = await getRefreshToken();
    var response = await dio.post('/user/updateTokens', data: refToken!=null?{"refreshToken": await getRefreshToken()}:null);
    final accessToken = response.data['accessToken'];
    final refreshToken = response.data['refreshToken'];
    saveTokens(accessToken, refreshToken);
    return accessToken;
  }
}