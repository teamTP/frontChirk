class ConfigAPI {
  static const String apiURL = 'http://10.0.2.2:8080';

}
enum ChirkListType {
  standard,
  myList,
  liked,
  disliked,
}

extension ChirkListTypeExtension on ChirkListType {
  //todo сделать когда будет
  String get value {
    switch (this) {
      case ChirkListType.standard:
        return '/feed';
      case ChirkListType.myList:
        return '/myChirks';
      case ChirkListType.liked:
        return '/feed';
      case ChirkListType.disliked:
        return '/feed';
    }
  }
}