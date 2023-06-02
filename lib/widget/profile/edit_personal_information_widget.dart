import 'package:chirk/widgetModel/profile/edit_personal_information_wm.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';

class EditPersonalInformationWidget
    extends ElementaryWidget<IEditPersonalInformationWM> {
  const EditPersonalInformationWidget(super.wmFactory, {super.key});

  @override
  Widget build(IEditPersonalInformationWM wm) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Изменить личные данные'),
        leading: IconButton(
          onPressed: () => wm.cancel(),
          icon: const Icon(Icons.clear),
        ),
        actions: <Widget>[
          IconButton(
              onPressed: () => wm.editInf(), icon: const Icon(Icons.done)),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: EntityStateNotifierBuilder(
            listenableEntityState: wm.userState,
            builder: (context, user) {
              return Form(
                key: wm.key,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 16),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Имя",
                        errorText: wm.isFirstNameValid
                            ? null
                            : "Поле не должно быть пустым",
                        border: OutlineInputBorder(),
                      ),
                      controller: wm.nameController,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      decoration: InputDecoration(
                        errorText: wm.isLastNameValid
                            ? null
                            : "Поле не должно быть пустым",
                        labelText: "Фамилия",
                        border: OutlineInputBorder(),
                      ),
                      controller: wm.surnameController,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
