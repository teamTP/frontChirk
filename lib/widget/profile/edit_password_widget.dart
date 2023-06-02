import 'package:chirk/widgetModel/profile/edit_password_wm.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';

class EditPasswordWidget extends ElementaryWidget<IEditPasswordWM> {
  const EditPasswordWidget(super.wmFactory, {super.key});

  @override
  Widget build(IEditPasswordWM wm) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Изменить личные данные'),
        leading: IconButton(
          onPressed: () => wm.cancel(),
          icon: const Icon(Icons.clear),
        ),
        actions: <Widget>[
          IconButton(
              onPressed: () => wm.editPas(),
              icon: const Icon(Icons.done)),
        ],
      ),
      body: Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: EntityStateNotifierBuilder(
            listenableEntityState: wm.passwordState,
            builder: (context, _) {
              return Form(
                key: wm.key,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 16),
                    TextFormField(
                      autocorrect: false,
                      controller: wm.oldPasswordController,
                      obscureText: wm.isHiddenPassword,
                      enableSuggestions: false,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                        labelText: "Старый пароль",
                        border: const OutlineInputBorder(),
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
                      controller: wm.newPasswordController,
                      obscureText: wm.isHiddenNewPassword,
                      enableSuggestions: false,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                        labelText: 'Введите пароль',
                        border: const OutlineInputBorder(),
                        errorText: wm.isPasswordValid ? null: "Плохой пароль",
                        suffixIcon: GestureDetector(
                          onTap: wm.toggleNewPasswordView,
                          child: Icon(
                            wm.isHiddenNewPassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      autocorrect: false,
                      controller: wm.newPasswordRetryController,
                      obscureText: wm.isHiddenNewPasswordRetry,
                      enableSuggestions: false,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                        labelText: "Повторите новый пароль",
                        border: const OutlineInputBorder(),
                        errorText: wm.isRepeatPasswordValid ? null: "Пароль не совпадает",
                        suffixIcon: GestureDetector(
                          onTap: wm.toggleNewPasswordRetryView,
                          child: Icon(
                            wm.isHiddenNewPasswordRetry
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),),
    );
  }
}
