import 'package:email_validator/email_validator.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:chirk/widgetModel/login/login_wm.dart';

class LoginWidget extends ElementaryWidget<ILoginWM> {
  const LoginWidget(super.wmFactory, {super.key});

  @override
  Widget build(ILoginWM wm) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Авторизация"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Авторизация',
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
                            errorText:
                                wm.isEmailValid ? null : "Неправильный email",
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
                            errorText:
                                wm.isPasswordValid ? null : wm.passwordError,
                            errorMaxLines: null,
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
                        ElevatedButton(
                          onPressed: () {
                            wm.logIn();
                          },
                          child: const Text('Авторизоватся'),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                Wrap(
                  alignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  runSpacing: 8, // Отступ между элементами при переносе
                  children: [
                    const Text(
                      "Еще нет аккаунта?",
                    ),
                    TextButton(
                        onPressed: () {
                          wm.goSignIn();
                        },
                        child: const Text('Зарегистрируйтесь'))
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
