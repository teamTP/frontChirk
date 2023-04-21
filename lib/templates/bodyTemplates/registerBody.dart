import 'package:flutter/material.dart';

class RegisterBody {
  static Widget addRegisterBody() {
    final _formKey = GlobalKey<FormState>();
    String _username = '';
    String _password = '';
    String _confirmPassword = '';
    String _firstName = '';
    String _lastName = '';

    return SafeArea(
      child: Container(
        margin: new EdgeInsets.only(top: 29, left: 16, right: 16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: TextFormField(
                  cursorColor: const Color.fromRGBO(176, 0, 32, 1),
                  decoration: const InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromRGBO(176, 0, 32, 1)),
                    ),
                    floatingLabelStyle:
                        TextStyle(color: Color.fromRGBO(176, 0, 32, 1)),
                    border: InputBorder.none,
                    filled: true,
                    fillColor: Color.fromRGBO(33, 33, 33, 0.08),
                    labelText: 'Логин',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Не может быть пустым';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _username = value!;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: TextFormField(
                  cursorColor: const Color.fromRGBO(176, 0, 32, 1),
                  decoration: const InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromRGBO(176, 0, 32, 1)),
                    ),
                    floatingLabelStyle:
                        TextStyle(color: Color.fromRGBO(176, 0, 32, 1)),
                    border: InputBorder.none,
                    filled: true,
                    fillColor: Color.fromRGBO(33, 33, 33, 0.08),
                    labelText: 'Пароль',
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Не может быть пустым';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _password = value!;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: TextFormField(
                  cursorColor: const Color.fromRGBO(176, 0, 32, 1),
                  decoration: const InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromRGBO(176, 0, 32, 1)),
                    ),
                    floatingLabelStyle:
                        TextStyle(color: Color.fromRGBO(176, 0, 32, 1)),
                    border: InputBorder.none,
                    filled: true,
                    fillColor: Color.fromRGBO(33, 33, 33, 0.08),
                    labelText: 'Повторите пароль',
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Не может быть пустым';
                    } else if (value != _password) {
                      return 'Неверный пароль';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _confirmPassword = value!;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: TextFormField(
                  cursorColor: const Color.fromRGBO(176, 0, 32, 1),
                  decoration: const InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromRGBO(176, 0, 32, 1)),
                    ),
                    floatingLabelStyle:
                        TextStyle(color: Color.fromRGBO(176, 0, 32, 1)),
                    border: InputBorder.none,
                    filled: true,
                    fillColor: Color.fromRGBO(33, 33, 33, 0.08),
                    labelText: 'Имя',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Не может быть пустым';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _firstName = value!;
                  },
                ),
              ),
              TextFormField(
                cursorColor: const Color.fromRGBO(176, 0, 32, 1),
                decoration: const InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromRGBO(176, 0, 32, 1)),
                  ),
                  floatingLabelStyle:
                      TextStyle(color: Color.fromRGBO(176, 0, 32, 1)),
                  border: InputBorder.none,
                  filled: true,
                  fillColor: Color.fromRGBO(33, 33, 33, 0.08),
                  labelText: 'Фамилия',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Не может быть пустым';
                  }
                  return null;
                },
                onSaved: (value) {
                  _lastName = value!;
                },
              ),
              Container(
                margin: const EdgeInsets.only(top: 91),
                child: ElevatedButton(
                  child: const Text(
                    'Зарегистрироваться',
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      // REGISTER HERE
                    }
                  },
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 19,left: 62),
                  child: Row(
                    children: [
                      const Text(
                        "Уже есть аккаунт?",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                      TextButton(
                          onPressed: () {}, child: const Text('Авторизоваться'))
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
