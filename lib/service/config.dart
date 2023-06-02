class Config{
  static const String apiURL =  "http://10.0.2.2:8080";
  static const String chirksAdd = "/chirks/add";
  static const String chirksDelete = '/chirks/delete';
  static String chirksUpdateVisible='/chirks/updateVisible';
  static const String estimateAdd = "/estimate/add";
  static const String userAuthorisation = "/user/authorisation";
  static const String userRegister = "/user/register";
  static const String profileUserProfile = '/profile/userProfile';
  static const String editPersonalInformation = '/profile/updateUserInfo';
  static const String editPassword = '/profile/updateUserPassword';

  static const String accessId = 'accessToken';
  static const String refreshId = 'accessToken';

}

enum ChirkListType {
  standard,
  myList,
  liked,
  disliked,
}

extension ChirkListTypeExtension on ChirkListType {
  String get value {
    switch (this) {
      case ChirkListType.standard:
        return '/feed';
      case ChirkListType.myList:
        return '/profile/myChirks';
      case ChirkListType.liked:
        return '/profile/myLikedChirks';
      case ChirkListType.disliked:
        return '/profile/myDislikedChirks';
    }
  }
}
