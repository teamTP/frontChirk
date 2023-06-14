import 'package:appmetrica_plugin/appmetrica_plugin.dart';
import 'package:chirk/service/provider/user_provider.dart';
import 'package:chirk/widget/login/signup_widget.dart';
import 'package:elementary/elementary.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

import 'package:chirk/entity/user.dart';
import 'package:chirk/model/login/sign_up_model.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../service/managers.dart';

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
    if (_validateEmail() &&
        _validatePassword() &&
        _validateRepeatPassword() &&
        _validateName() &&
        _validateLastName()) {
      User user = User(
          id: 0,
          login: _emailTextInputController.text.toLowerCase(),
          password: _passwordTextInputController.text,
          iconId: 0,
          name: _nameTextInputController.text,
          surname: _surnameTextInputController.text);
      model.signUp(user).then((value) async {
        if (value == null) {
          final tokenProvider =
              Provider.of<TokenProvider>(context, listen: false);
          tokenProvider.setTokens(await TokenManager.getAccessToken() ?? '',
              await TokenManager.getRefreshToken() ?? '');

          AppMetrica.reportEvent("sign_up");
          goBack();
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setBool('firstSeen', false);
          //Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
        } else {
          final snackBar = SnackBar(
            content: Text(value),
            duration: const Duration(seconds: 3),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      });
    }
  }

  void goBack() {
    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
  }

  bool _validateName() {
    bool isValid = _nameTextInputController.text.isNotEmpty;
    isFirstNameValid = isValid;
    model.userState.content(User.empty);
    return isValid;
  }

  bool _validateLastName() {
    bool isValid = _surnameTextInputController.text.isNotEmpty;
    isLastNameValid = isValid;
    model.userState.content(User.empty);
    return isValid;
  }

  bool _validateEmail() {
    bool isValid = EmailValidator.validate(_emailTextInputController.text);
    isEmailValid = isValid;
    model.userState.content(User.empty);
    return isValid;
  }

  bool _validatePassword() {
    bool isValid = validatePassword(_passwordTextInputController.text);
    isPasswordValid = isValid;
    model.userState.content(User.empty);
    return isValid;
  }

  bool _validateRepeatPassword() {
    bool isValid = _passwordTextRepeatInputController.text ==
        _passwordTextInputController.text;
    isRepeatPasswordValid = isValid;
    model.userState.content(User.empty);
    return isValid;
  }

  @override
  void togglePasswordView() {
    model.isHiddenPassword = !model.isHiddenPassword;
    model.userState.content(User.empty);
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

  @override
  get passwordError {
    String password = _passwordTextInputController.text;
    // Проверка на количество символов
    if (password.length < 6) {
      return 'Пароль должен содержать не менее 6 символов';
    }

    // Проверка на наличие цифры
    if (!password.contains(RegExp(r'\d'))) {
      return 'Пароль должен содержать цифры';
    }

    // Проверка на наличие прописной буквы
    if (!password.contains(RegExp(r'[A-Z]'))) {
      return 'Пароль должен содержать заглавные буквы';
    }

    // Проверка на наличие строчной буквы
    if (!password.contains(RegExp(r'[a-z]'))) {
      return 'Пароль должен содержать строчные букву';
    }

    // Возвращаем null, если пароль прошел все проверки
    return null;
  }
}

abstract class ISignUpWM extends IWidgetModel {
  bool isFirstNameValid = true;
  bool isLastNameValid = true;
  bool isEmailValid = true;
  bool isPasswordValid = true;
  bool isRepeatPasswordValid = true;

  get passwordError;

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
