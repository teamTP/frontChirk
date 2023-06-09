import 'package:shared_preferences/shared_preferences.dart';

class User {
  int id;
  String login;
  String password;
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

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: 0,
      login: json['email'] as String,
      password: '',
      iconId: json['iconId'] as int,
      name: json['firstname'] as String,
      surname: json['lastname'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'login': login,
        'password': password,
        'userIconId': iconId,
        'firstName': name,
        'lastName': surname,
      };

  Map<String, dynamic> toRegisterJson() => {
        'email': login,
        'password': password,
        'firstname': name,
        'lastname': surname,
      };

  static get empty =>
      User(id: 0, login: '', password: '', iconId: 0, name: '', surname: '');

  Map<String, dynamic> toFeedJson(int page) => {
        'page': page,
      };
}

class UserRepository {
  static const String keyPrefix = 'user_';

  Future<void> saveUser(User user) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('${keyPrefix}id', user.id);
    await prefs.setString('${keyPrefix}login', user.login);
    await prefs.setString('${keyPrefix}password', user.password);
    await prefs.setInt('${keyPrefix}iconId', user.iconId);
    await prefs.setString('${keyPrefix}name', user.name);
    await prefs.setString('${keyPrefix}surname', user.surname);
  }

  Future<User?> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    final id = prefs.getInt('${keyPrefix}id');
    final login = prefs.getString('${keyPrefix}login');
    final password = prefs.getString('${keyPrefix}password');
    final iconId = prefs.getInt('${keyPrefix}iconId');
    final name = prefs.getString('${keyPrefix}name');
    final surname = prefs.getString('${keyPrefix}surname');

    if (id != null && login != null && password != null) {
      return User(
        id: id,
        login: login,
        password: password,
        iconId: iconId ?? 0,
        name: name ?? '',
        surname: surname ?? '',
      );
    }

    return null;
  }

  Future<void> deleteUser() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('${keyPrefix}id');
    await prefs.remove('${keyPrefix}login');
    await prefs.remove('${keyPrefix}password');
    await prefs.remove('${keyPrefix}iconId');
    await prefs.remove('${keyPrefix}name');
    await prefs.remove('${keyPrefix}surname');
  }
}
