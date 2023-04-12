import 'package:chirk/models/user.dart';
import 'package:chirk/repository/abstract/userRepository.dart';

class UserRepositoryList extends UserRepository{
  final List<User> _users = [];

  @override
  Future<void> addUser(User user) async {
    _users.add(user);
  }

  @override
  Future<void> deleteUser(User user) async{
    _users.removeWhere((c) => c.id == user.id);
  }

  @override
  Future<List<User>> getUsers() async {
    // здесь может быть логика получения чирков из другого источника, например, базы данных
      return _users;
  }

  @override
  Future<void> updateUser(User user) async{
    // TODO: implement updateChirk
    final index = _users.indexWhere((c) => c.id == user.id);
    if (index >= 0) {
      _users[index] = user;
    }
  }
}
