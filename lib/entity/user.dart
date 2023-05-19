import 'dart:convert';
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
<<<<<<< Updated upstream
=======

>>>>>>> Stashed changes
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int,
      login: json['login'] as String,
      password: json['password'] as String,
      iconId: json['iconId'] as int,
      name: json['name'] as String,
      surname: json['surname'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'login': login,
    'password': password,
<<<<<<< Updated upstream
    'iconId': iconId,
    'firstName': name,
    'lastName': surname,
  };

=======
    'userIconId': iconId,
    'firstName': name,
    'lastName': surname,
  };
  Map<String, dynamic> toFeedJson(int page) => {
    'userId': id,
    'page': page,
  };
>>>>>>> Stashed changes
}
