import 'package:chirk/editProfile/edit_personal_information_wm.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';

class EditPersonalInformationWidget
    extends ElementaryWidget<IEditPersonalInformationWM> {
  const EditPersonalInformationWidget(super.wmFactory, {super.key});

  @override
  Widget build(IEditPersonalInformationWM wm) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Изменить личные данные'),
        leading: IconButton(
          onPressed: () => wm.cancel(),
          icon: Icon(Icons.clear),
        ),
        actions: <Widget>[
          IconButton(onPressed: () => wm.editInf(), icon: Icon(Icons.done)),
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
                  decoration: InputDecoration(
                    labelText: "Имя",
                    border: OutlineInputBorder(),
                  ),
                  controller: wm.nameController,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Фамилия",
                    border: OutlineInputBorder(),
                  ),
                  controller: wm.surnameController,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
