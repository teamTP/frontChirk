class User {
  final int _id;
  int iconId;
  String name;
  String surname;
  final String _login;

  User(this._id, this.iconId, this.name, this.surname, this._login);

  String get login => _login;

  int get id => _id;
}
