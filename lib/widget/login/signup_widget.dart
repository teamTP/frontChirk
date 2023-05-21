import 'package:email_validator/email_validator.dart';
import 'package:chirk/widgetModel/signUp/signup_wm.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';

class SignUpWidget extends ElementaryWidget<ISignUpWM> {
  SignUpWidget(super.wmFactory);

  @override
  Widget build(ISignUpWM wm) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Регистрация"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Регистрация',
                  style: wm.theme.textTheme.titleLarge,
                ),
                const SizedBox(height: 32),
                EntityStateNotifierBuilder(
                  listenableEntityState: wm.userState,
                  builder: (context, user) => Form(
                    key: wm.key,
                    child: Column(
                      children: [
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          autocorrect: false,
                          controller: wm.emailController,
                          validator: (email) =>
                              email != null && !EmailValidator.validate(email)
                                  ? 'Введите правильный email'
                                  : null,
                          decoration: InputDecoration(
                            labelText: 'Введите email',
                            border: OutlineInputBorder(),
                            errorText: wm.isEmailValid ? null : "Неправильный email"
                          ),
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          autocorrect: false,
                          controller: wm.passwordController,
                          obscureText: wm.isHiddenPassword,
                          enableSuggestions: false,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (password) =>
                              password != null && !wm.validatePassword(password)
                                  ? 'Слабый пароль'
                                  : null,
                          decoration: InputDecoration(
                            labelText: 'Введите пароль',
                            border: OutlineInputBorder(),
                            errorText: wm.isPasswordValid ? null:"Слабый пароль",
                            suffixIcon: GestureDetector(
                              onTap: wm.togglePasswordView,
                              child: Icon(
                                wm.isHiddenPassword
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          autocorrect: false,
                          controller: wm.passwordRepeatController,
                          obscureText: wm.isHiddenPassword,
                          enableSuggestions: false,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (passwordRepeat) => passwordRepeat !=
                                      null &&
                                  (!wm.validatePassword(passwordRepeat) ||
                                      wm.passwordController.value.text !=
                                          passwordRepeat)
                              ? 'Не правильный пароль'
                              : null,
                          decoration: InputDecoration(
                            labelText: 'Повторите пароль',
                            border: OutlineInputBorder(),
                            errorText: wm.isRepeatPasswordValid ? null:"Не правильный пароль",
                            suffixIcon: GestureDetector(
                              onTap: wm.togglePasswordView,
                              child: Icon(
                                wm.isHiddenPassword
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: wm.nameController,
                          decoration: InputDecoration(
                            labelText: 'Введите имя',
                            errorText: wm.isFirstNameValid ? null:"Поле не должно быть пустым",
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: wm.surnameController,
                          validator: (surname) =>
                              //todo реализовать ошибку или забить
                              surname == null || surname.isEmpty
                                  ? 'Поле не должно быть пустым'
                                  : null,
                          decoration: InputDecoration(
                            labelText: 'Введите фамилию',

                            errorText: wm.isLastNameValid ? null:"Поле не должно быть пустым",
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () {
                            wm.signUp();
                          },
                          child: Text('Зарегистрироватся'),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Уже есть аккаунт?",
                    ),
                    TextButton(
                        onPressed: () {
                          wm.goLogIn();
                        },
                        child: const Text('Авторизуйтесь'))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
