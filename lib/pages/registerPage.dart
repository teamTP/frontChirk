import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  String _username = '';
  String _password = '';
  String _confirmPassword = '';
  String _firstName = '';
  String _lastName = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text("Регистрация"),
      ),
      body: addRegisterBody(),
    );
  }

  Widget addRegisterBody() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: GlobalKey<FormState>(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 29.0),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Не может быть пустым';
                  }
                  return null;
                },
                onSaved: (value) {
                  _username = value!;
                },
                decoration: const InputDecoration(
                  labelText: 'Логин',
                ),
              ),
              const SizedBox(height: 20.0),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Не может быть пустым';
                  }
                  return null;
                },
                onSaved: (value) {
                  _password = value!;
                },
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Пароль',
                ),
              ),
              const SizedBox(height: 20.0),
              TextFormField(
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
                decoration: const InputDecoration(
                  labelText: 'Повторите пароль',
                ),
              ),
              const SizedBox(height: 20.0),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Не может быть пустым';
                  }
                  return null;
                },
                onSaved: (value) {
                  _firstName = value!;
                },
                decoration: const InputDecoration(
                  labelText: 'Имя',
                ),
              ),
              const SizedBox(height: 20.0),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Не может быть пустым';
                  }
                  return null;
                },
                onSaved: (value) {
                  _lastName = value!;
                },
                decoration: const InputDecoration(
                  labelText: 'Фамилия',
                ),
              ),
              const SizedBox(height: 20.0),
              Center(
                child: TextButton(
                  onPressed: () {},
                  child: const Text('Авторизоваться'),
                ),
              ),
              const SizedBox(height: 50.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Уже есть аккаунт?",
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/login");
                      },
                      child: const Text('Авторизоваться'))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}