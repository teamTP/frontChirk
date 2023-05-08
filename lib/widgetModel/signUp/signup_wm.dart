import 'package:chirk/widget/login/signup_widget.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';

import '../../model/signUp/signup_model.dart';

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
    // TODO: implement signUp
    throw UnimplementedError();
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
