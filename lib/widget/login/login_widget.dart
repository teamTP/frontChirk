import 'package:flutter/material.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final _formKey = GlobalKey<FormState>();
  String? _email;
  String? _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Авторизация"),
      ),
      body: addLoginBody(),
    );
  }

  Widget addLoginBody() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: GlobalKey<FormState>(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 100.0),
              const Center(
                child: Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              TextFormField(
                validator: (input) {
                  return null;
                },
                onSaved: (input) => _email = input,
                decoration: const InputDecoration(
                  labelText: 'Email',
                ),
              ),
              const SizedBox(height: 20.0),
              TextFormField(
                validator: (input) {
                  return null;
                },
                onSaved: (input) => _password = input,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                ),
              ),
              const SizedBox(height: 20.0),
              Center(
                child: TextButton(
                  onPressed: () {
                    // TODO: Perform login action
                  },
                  child: const Text('Login'),
                ),
              ),
              const SizedBox(height: 100.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Еще нет аккаунта?",
                  ),
                  TextButton(
                      onPressed: () {
                        //Navigator.of(context).popUntil((route) => route.isFirst);
                        //Navigator.pushNamed(context, "/register");
                        Navigator.pushNamedAndRemoveUntil(context, '/register', (route) => route.isFirst);
                      },
                      child: const Text('Зарегистрируйтесь'))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
