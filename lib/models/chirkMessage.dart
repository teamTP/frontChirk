
import 'package:chirk/models/user.dart';

class Chirk{
  final int _chirkId;
  final DateTime _dateTime;
  final String _text;
  final User _user;
  int likeCount;
  int disLikeCount;
  bool? liked;


  Chirk(this._chirkId, this._dateTime, this._text, this._user, [this.liked, this.likeCount=0, this.disLikeCount=0]);


  User get user => _user;

  String get text => _text;

  DateTime get dateTime => _dateTime;

  int get chirkId => _chirkId;
}