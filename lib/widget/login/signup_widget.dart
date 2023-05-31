import 'package:email_validator/email_validator.dart';
import 'package:chirk/widgetModel/login/signup_wm.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';

class SignUpWidget extends ElementaryWidget<ISignUpWM> {
  const SignUpWidget(super.wmFactory, {super.key});

  @override
  Widget build(ISignUpWM wm) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Регистрация"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(32),
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
                          decoration: InputDecoration(
                            labelText: 'Введите email',
                            border: const OutlineInputBorder(),
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
                          decoration: InputDecoration(
                            labelText: 'Введите пароль',
                            border: const OutlineInputBorder(),
                            errorText: wm.isPasswordValid ? null:wm.passwordError,
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
                          decoration: InputDecoration(
                            labelText: 'Повторите пароль',
                            border: const OutlineInputBorder(),
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
                            border: const OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: wm.surnameController,
                          decoration: InputDecoration(
                            labelText: 'Введите фамилию',

                            errorText: wm.isLastNameValid ? null:"Поле не должно быть пустым",
                            border: const OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () {
                            wm.signUp();
                          },
                          child: const Text('Зарегистрироватся'),
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
