import 'package:flutter/material.dart';

class EditProfileWidget extends StatefulWidget {
  const EditProfileWidget({super.key});

  @override
  _EditProfileWidgetState createState() => _EditProfileWidgetState();
}

class _EditProfileWidgetState extends State<EditProfileWidget> {
  final _formKey = GlobalKey<FormState>();
  String? _name;
  String? _surname;
  String? _newPass;
  String? _oldPass;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Редактировать"),
      ),
      body: addEditBody(),
    );
  }

  Widget addEditBody() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: GlobalKey<FormState>(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: CircleAvatar(
                  radius:
                      Theme.of(context).textTheme.headlineMedium!.fontSize! * 2,
                ),
              ),
              TextFormField(
                validator: (input) {
                  return null;
                },
                onSaved: (input) => _name = input,
                decoration: const InputDecoration(
                  labelText: 'Имя',
                ),
              ),
              const SizedBox(height: 20.0),
              TextFormField(
                validator: (input) {
                  return null;
                },
                onSaved: (input) => _surname = input,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Фамилия',
                ),
              ),
              const SizedBox(height: 20.0),
              TextFormField(
                validator: (input) {
                  return null;
                },
                onSaved: (input) => _newPass = input,
                decoration: const InputDecoration(
                  labelText: 'Новый пароль',
                ),
              ),
              const SizedBox(height: 20.0),
              TextFormField(
                validator: (input) {
                  return null;
                },
                onSaved: (input) => _oldPass = input,
                decoration: const InputDecoration(
                  labelText: 'Старый пароль',
                ),
              ),
              const SizedBox(height: 20.0),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // TODO:  edit action
                  },
                  child: const Text('Сохранить изменения'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
