
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
<<<<<<< Updated upstream
      id: json['id'] as int,
      dateTime: DateTime.parse(json['dateTime'] as String),
      text: json['text'] as String,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      likeCount: json['likeCount'] as int,
      disLikeCount: json['disLikeCount'] as int,
      liked: json['liked'] as bool,
=======
      id: json['chirkId'] as int,
      dateTime: DateTime.parse(json['createdDate'] as String),
      text: json['text'] as String,
      user: User(id: 0, iconId: json['userIconId'], name: json['userFirstname'], login: '', password: '', surname: json['userLastname']),
      likeCount: json['countLike'] as int,
      disLikeCount: json['countDislike'] as int,
      liked: json['reaction']=='LIKE'?true:json['reaction']=='DISLIKE'?false:null,
>>>>>>> Stashed changes
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
<<<<<<< Updated upstream
=======
  Map<String, dynamic> toLikeJson() => {
    'idUser': 1,
    'idChirk': id,
    'isLiked': liked,
  };

  Map<String, dynamic> toRegJson() => {
    'firstName': "firstName",
    'lastname': "lastname",
    'email': "email",
    'password': "password"
  };
>>>>>>> Stashed changes
}
