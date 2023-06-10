import 'package:chirk/model/profile/edit_password_model.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';

import '../../widget/profile/edit_password_widget.dart';

class EditPasswordWM extends WidgetModel<EditPasswordWidget, EditPasswordModel>
    implements IEditPasswordWM {
  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _newPasswordRetryController =
      TextEditingController();
  final Key _key = GlobalKey<FormState>();
  final EntityStateNotifier _passwordState = EntityStateNotifier();
  bool _isPasswordValid = true;
  bool _isRepeatPasswordValid = true;
  bool _isHiddenPassword = true;
  bool _isHiddenNewPassword = true;
  bool _isHiddenNewPasswordRetry = true;

  EditPasswordWM(super.model);

  @override
  void cancel() {
    Navigator.pop(context);
  }

  @override
  Key get key => _key;

  @override
  void editPas() async {
    if (_validatePassword() && _validateRepeatPassword()) {
      await model
          .editPas(_oldPasswordController.text, _newPasswordController.text)
          .then((value) {
        if (value != null) {
          final snackBar = SnackBar(
            content: Text(value),
            duration: const Duration(seconds: 3),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        } else {
          Navigator.pop(context);
        }
      });
    }
  }

  @override
  TextEditingController get newPasswordController => _newPasswordController;

  @override
  TextEditingController get newPasswordRetryController =>
      _newPasswordRetryController;

  @override
  TextEditingController get oldPasswordController => _oldPasswordController;

  bool _validatePassword() {
    bool isValid = validatePassword(_newPasswordController.text);
    _isPasswordValid = isValid;
    passwordState.content("");
    return isValid;
  }

  bool _validateRepeatPassword() {
    bool isValid =
        _newPasswordRetryController.text == newPasswordController.text;
    _isRepeatPasswordValid = isValid;
    passwordState.content("");
    return isValid;
  }

  bool validatePassword(value) {
    RegExp regex = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{6,}$');
    return regex.hasMatch(value);
  }

  @override
  void togglePasswordView() {
    _isHiddenPassword = !_isHiddenPassword;
    passwordState.content('');
  }

  @override
  void toggleNewPasswordView() {
    _isHiddenNewPassword = !_isHiddenNewPassword;
    passwordState.content('');
  }

  @override
  void toggleNewPasswordRetryView() {
    _isHiddenNewPasswordRetry = !_isHiddenNewPasswordRetry;
    passwordState.content('');
  }

  @override
  bool get isHiddenPassword => _isHiddenPassword;

  @override
  bool get isHiddenNewPassword => _isHiddenNewPassword;

  @override
  bool get isHiddenNewPasswordRetry => _isHiddenNewPasswordRetry;

  @override
  EntityStateNotifier get passwordState => _passwordState;

  @override
  get isPasswordValid => _isPasswordValid;

  @override
  get isRepeatPasswordValid => _isRepeatPasswordValid;
}

abstract class IEditPasswordWM extends IWidgetModel {
  bool get isPasswordValid;

  bool get isRepeatPasswordValid;

  bool get isHiddenPassword;

  bool get isHiddenNewPassword;

  bool get isHiddenNewPasswordRetry;

  TextEditingController get oldPasswordController;

  TextEditingController get newPasswordController;

  TextEditingController get newPasswordRetryController;

  EntityStateNotifier get passwordState;

  Key get key;

  void togglePasswordView();

  void toggleNewPasswordView();

  void toggleNewPasswordRetryView();

  void editPas();

  void cancel();
}
