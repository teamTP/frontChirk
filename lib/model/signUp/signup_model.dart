import 'package:elementary/elementary.dart';

import '../../entity/user.dart';

class SignUpModel extends ElementaryModel{
  bool _isHiddenPassword = true;
  EntityStateNotifier<User> _userState = EntityStateNotifier();

  bool get isHiddenPassword => _isHiddenPassword;

  set isHiddenPassword(bool value) {
    _isHiddenPassword = value;
  }

  EntityStateNotifier<User> get userState => _userState;

  set userState(EntityStateNotifier<User> value) {
    _userState = value;
  }
}
