
import 'package:chirk/entity/user.dart';

class Chirk {
  final int id;
  final DateTime dateTime;
  final String text;
  final User user;
  int likeCount;
  int disLikeCount;
  bool? liked;

  Chirk(
      {required this.id,
      required this.dateTime,
      required this.text,
      required this.user,
      this.likeCount = 0,
      this.disLikeCount = 0,
      this.liked});
}
