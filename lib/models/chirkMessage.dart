
class Chirk{
  final int _chirkId;
  final DateTime _dateTime;
  final String _text;
  final int _userId;
  final int _iconId;
  final String _userName;
  final String _userSurname;
  int _likeCount;
  int _disLikeCount;
  bool? _liked;


  Chirk(this._chirkId, this._dateTime, this._text, this._userId, this._iconId,
      this._userName, this._userSurname, [this._liked, this._likeCount=0, this._disLikeCount=0]);

  String get userSurname => _userSurname;

  String get userName => _userName;

  int get iconId => _iconId;

  int get userId => _userId;

  String get text => _text;

  DateTime get dateTime => _dateTime;

  int get chirkId => _chirkId;


  int get likeCount => _likeCount;

  int get disLikeCount => _disLikeCount;

  bool? get liked => _liked;

  set liked(bool? value) {
    _liked = value;
  }

  set disLikeCount(int value) {
    _disLikeCount = value;
  }

  set likeCount(int value) {
    _likeCount = value;
  }
}