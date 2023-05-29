import 'package:chirk/editProfile/edit_password_model/edit_password_wm.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';

class EditPasswordWidget extends ElementaryWidget<IEditPasswordWM> {
  const EditPasswordWidget(super.wmFactory, {super.key});

  @override
  Widget build(IEditPasswordWM wm) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Изменить личные данные'),
        leading: IconButton(
          onPressed: () => wm.cancel(),
          icon: const Icon(Icons.clear),
        ),
        actions: <Widget>[
          IconButton(onPressed: () => wm.editPas(), icon: const Icon(Icons.done)),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Form(
            key: wm.key,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 16),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Старый пароль",
                    border: OutlineInputBorder(),
                  ),
                  controller: wm.oldPasswordController,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Новый пароль",
                    border: OutlineInputBorder(),
                  ),
                  controller: wm.newPasswordController,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Повторите новый пароль",
                    border: OutlineInputBorder(),
                  ),
                  controller: wm.newPasswordRetryController,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}