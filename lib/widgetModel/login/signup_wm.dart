import 'package:chirk/widget/login/signup_widget.dart';
import 'package:elementary/elementary.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

import 'package:chirk/entity/user.dart';
import 'package:chirk/model/login/signup_model.dart';

class SignUpWM extends WidgetModel<SignUpWidget, SignUpModel>
    implements ISignUpWM {
  final TextEditingController _emailTextInputController =
      TextEditingController();
  final TextEditingController _passwordTextInputController =
      TextEditingController();
  final TextEditingController _passwordTextRepeatInputController =
      TextEditingController();
  final TextEditingController _nameTextInputController =
      TextEditingController();
  final TextEditingController _surnameTextInputController =
      TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  bool isFirstNameValid = true;
  @override
  bool isLastNameValid = true;
  @override
  bool isEmailValid = true;
  @override
  bool isPasswordValid = true;
  @override
  bool isRepeatPasswordValid = true;

  SignUpWM(super.model);

  @override
  void dispose() {
    _emailTextInputController.dispose();
    _passwordTextInputController.dispose();
    _passwordTextRepeatInputController.dispose();
    _nameTextInputController.dispose();
    _surnameTextInputController.dispose();

    super.dispose();
  }

  @override
  Future signUp() async {
    if (_validatePassword() &&
        _validateEmail() &&
        _validateLastName() &&
        _validateName() &&
        _validateRepeatPassword()) {
      User user = User(
          id: 0,
          login: _emailTextInputController.text,
          password: _passwordTextInputController.text,
          iconId: 0,
          name: _nameTextInputController.text,
          surname: _surnameTextInputController.text);
      model.signUp(user).then((value) {
        if(value==null) {
          Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
        }else{
          final snackBar = SnackBar(
            content: Text(value),
            duration: const Duration(seconds: 3),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      });
    }
  }

  bool _validateName() {
    bool isValid = _nameTextInputController.text.isNotEmpty;
    isFirstNameValid = isValid;
    model.userState.notifyListeners();
    return isValid;
  }

  bool _validateLastName() {
    bool isValid = _surnameTextInputController.text.isNotEmpty;
    isLastNameValid = isValid;
    model.userState.notifyListeners();
    return isValid;
  }

  bool _validateEmail() {
    bool isValid = EmailValidator.validate(_emailTextInputController.text);
    isEmailValid = isValid;
    model.userState.notifyListeners();
    return isValid;
  }

  bool _validatePassword() {
    bool isValid = validatePassword(_passwordTextInputController.text);
    isPasswordValid = isValid;
    model.userState.notifyListeners();
    return isValid;
  }

  bool _validateRepeatPassword() {
    bool isValid = _passwordTextRepeatInputController.text ==
        _passwordTextInputController.text;
    isPasswordValid = isValid;
    model.userState.notifyListeners();
    return isValid;
  }

  @override
  void togglePasswordView() {
    model.isHiddenPassword = !model.isHiddenPassword;
    model.userState.notifyListeners();
  }

  @override
  void goLogIn() {
    Navigator.pushNamedAndRemoveUntil(
        context, '/login', (route) => route.isFirst);
  }

  @override
  ThemeData get theme => Theme.of(context);

  @override
  Key get key => formKey;

  @override
  bool get isHiddenPassword => model.isHiddenPassword;

  @override
  TextEditingController get emailController => _emailTextInputController;

  @override
  TextEditingController get nameController => _nameTextInputController;

  @override
  TextEditingController get passwordController => _passwordTextInputController;

  @override
  TextEditingController get passwordRepeatController =>
      _passwordTextRepeatInputController;

  @override
  TextEditingController get surnameController => _surnameTextInputController;

  @override
  bool validatePassword(value) {
    RegExp regex = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{6,}$');
    return regex.hasMatch(value);
  }

  @override
  EntityStateNotifier get userState => model.userState;
}

abstract class ISignUpWM extends IWidgetModel {
  bool isFirstNameValid = true;
  bool isLastNameValid = true;
  bool isEmailValid = true;
  bool isPasswordValid = true;
  bool isRepeatPasswordValid = true;

  void togglePasswordView();

  Future signUp();

  void goLogIn();

  ThemeData get theme;

  Key get key;

  bool get isHiddenPassword;

  TextEditingController get emailController;

  TextEditingController get passwordController;

  TextEditingController get passwordRepeatController;

  TextEditingController get nameController;

  TextEditingController get surnameController;

  bool validatePassword(value);

  EntityStateNotifier get userState;
}
