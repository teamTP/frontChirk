import 'package:flutter/foundation.dart';

import '../entity/user.dart';

class UserProvider with ChangeNotifier {
  UserRepository _userRepository = UserRepository();

  Future<User?> get user => _userRepository.getUser();

  void setUser(User newUser) {
    _userRepository.saveUser(newUser);
    notifyListeners();
  }
  void deleteUser(){
    _userRepository.deleteUser();
    notifyListeners();
  }
}