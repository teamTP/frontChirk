
class Chirk{
  final int _chirkId;
  final DateTime _dateTime;
  final String _text;
  final int _userId;
  final int _iconId;
  final String _userName;
  final String _userSurname;
  bool _liked;


  Chirk(this._chirkId, this._dateTime, this._text, this._userId, this._iconId,
      this._userName, this._userSurname, this._liked);

  String get userSurname => _userSurname;

  String get userName => _userName;

  int get iconId => _iconId;

  int get userId => _userId;

  bool get isLiked => _liked;

  String get text => _text;

  DateTime get dateTime => _dateTime;

  int get chirkId => _chirkId;

  set liked(bool value) {
    _liked = value;
  }
}