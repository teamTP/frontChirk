class User {
  int _id;
  int _iconId;
  String _name="";
  String _surname="";
  String _login="";

  User(this._id, this._iconId, this._name, this._surname, this._login);

  String get login => _login;

  String get surname => _surname;

  String get name => _name;

  int get iconId => _iconId;

  int get Id => _id;
}
