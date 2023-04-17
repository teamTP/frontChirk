class User {
  final int id;
  final String login;
  final String password;
  int iconId;
  String name;
  String surname;

  User({
    required this.id,
    required this.login,
    required this.password,
    required this.iconId,
    required this.name,
    required this.surname,
  });
}
