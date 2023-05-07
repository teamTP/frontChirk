
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

  factory Chirk.fromJson(Map<String, dynamic> json) {
    return Chirk(
      id: json['id'] as int,
      dateTime: DateTime.parse(json['dateTime'] as String),
      text: json['text'] as String,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      likeCount: json['likeCount'] as int,
      disLikeCount: json['disLikeCount'] as int,
      liked: json['liked'] as bool,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'dateTime': dateTime.toIso8601String(),
    'text': text,
    'user': user.toJson(),
    'likeCount': likeCount,
    'disLikeCount': disLikeCount,
    'liked': liked,
  };
}
