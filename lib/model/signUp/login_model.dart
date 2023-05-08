import 'package:elementary/elementary.dart';

import '../../entity/user.dart';

class LoginModel extends ElementaryModel {
  bool isHiddenPassword = true;
  EntityStateNotifier<User> _userState = EntityStateNotifier();

  EntityStateNotifier<User> get userState => _userState;

  set userState(EntityStateNotifier<User> value) {
    _userState = value;
  }
}
