import 'package:chirk/repository/abstract/userRepository.dart';

import '../models/user.dart';

class UserService{

  final UserRepository _repository;

  UserService(this._repository);

  Future<List<User>> getUsers() async {
    return _repository.getUsers();
  }

  Future<void> addUser(User user) async {
    await _repository.addUser(user);
  }

  Future<void> updateUser(User user) async {
    await _repository.updateUser(user);
  }

  Future<void> deleteUser(User user) async {
    await _repository.deleteUser(user);
  }
}