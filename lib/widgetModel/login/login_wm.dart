import 'package:chirk/service/managers.dart';
import 'package:chirk/widget/login/login_widget.dart';
import 'package:elementary/elementary.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

import 'package:chirk/entity/user.dart';
import 'package:chirk/model/login/login_model.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../provider/user_provider.dart';

class LoginWM extends WidgetModel<LoginWidget, LoginModel> implements ILoginWM {
  final TextEditingController _emailTextInputController =
      TextEditingController();
  final TextEditingController _passwordTextInputController =
      TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isEmailValid = true;
  bool isPasswordValid = true;

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
    if (_validatePassword() && _validateEmail()) {
      User user = User.empty;
      user.login = _emailTextInputController.text.toLowerCase();
      user.password = _passwordTextInputController.text;
      model.logIn(user).then((value) async{
        if(value==null){
          final tokenProvider = Provider.of<TokenProvider>(context, listen: false);
          tokenProvider.setTokens(await TokenManager.getAccessToken()??'', await TokenManager.getRefreshToken()??'');
          //Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
          Navigator.pop(context);
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setBool('firstSeen', false);
        }else{
          final snackBar = SnackBar(
            content: Text(value),
            duration: const Duration(seconds: 3),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      });
    }
    //throw UnimplementedError();
  }

  bool _validateEmail() {
    bool isValid = EmailValidator.validate(_emailTextInputController.text);
    isEmailValid = isValid;
    userState.notifyListeners();
    return isValid;
  }

  bool _validatePassword() {
    bool isValid = validatePassword(_passwordTextInputController.text);
    isPasswordValid = isValid;
    userState.notifyListeners();
    return isValid;
  }

  bool validatePassword(value) {
    RegExp regex = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{6,}$');
    return regex.hasMatch(value);
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

  static User initUser() {
    return User(
        id: 1,
        iconId: 0,
        name: "Иван",
        surname: "Сидоров",
        login: "ivan@sidorov.ru",
        password: ":OHG:25L:JHG");
  }
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
