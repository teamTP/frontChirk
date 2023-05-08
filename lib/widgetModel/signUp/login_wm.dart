import 'package:chirk/widget/login/login_widget.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';

import '../../entity/user.dart';
import '../../model/signUp/login_model.dart';

class LoginWM extends WidgetModel<LoginWidget, LoginModel> implements ILoginWM {
  final TextEditingController _emailTextInputController =
      TextEditingController();
  final TextEditingController _passwordTextInputController =
      TextEditingController();
  final formKey = GlobalKey<FormState>();

  LoginWM(super.model);

  @override
  void dispose() {
    _emailTextInputController.dispose();
    _passwordTextInputController.dispose();
    super.dispose();
  }

  @override
  TextEditingController get emailController => _emailTextInputController;

  @override
  TextEditingController get passwordController => _passwordTextInputController;

  @override
  Future logIn() async {
    // TODO: implement logIn
    throw UnimplementedError();
  }

  @override
  void togglePasswordView() {
    model.isHiddenPassword = !model.isHiddenPassword;
    model.userState.notifyListeners();
  }

  @override
  void goSignIn() {
    Navigator.of(context)
        .pushNamedAndRemoveUntil('/register', (route) => route.isFirst);
  }

  @override
  ThemeData get theme => Theme.of(context);

  @override
  Key get key => formKey;

  @override
  bool get isHiddenPassword => model.isHiddenPassword;

  @override
  EntityStateNotifier<User> get userState => model.userState;
}

abstract class ILoginWM extends IWidgetModel {
  void togglePasswordView();

  Future logIn();

  void goSignIn();

  ThemeData get theme;

  Key get key;

  bool get isHiddenPassword;

  TextEditingController get emailController;

  TextEditingController get passwordController;

  EntityStateNotifier<User> get userState;
}
