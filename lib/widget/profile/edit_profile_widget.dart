import 'package:chirk/widgetModel/profile/edit_profile_wm.dart';
import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';

class EditProfileWidget extends ElementaryWidget<EditProfileWM> {
  const EditProfileWidget(super.wmFactory, {super.key});

  @override
  Widget build(EditProfileWM wm) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Редактирование"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              EntityStateNotifierBuilder(
                  listenableEntityState: wm.userState,
                  builder: (context, user) {
                    if (user != null) {
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            children: [
                              CircleAvatar(
                                  radius: 48,
                                  backgroundImage: wm.userIcon,
                                  child: SizedBox(
                                    width: double.infinity,
                                    height: double.infinity,
                                    child: IconButton(
                                        onPressed: () {
                                          wm.toEditIcon();
                                        },
                                        icon: const Icon(
                                          Icons.camera_alt_outlined,
                                          color: Colors.white,
                                          size: 48,
                                        ),
                                        style: IconButton.styleFrom(
                                            backgroundColor: Colors.black26)),
                                  )), // иконка
                              const SizedBox(
                                height: 24,
                              ),
                              Text(
                                '${user.name} ${user.surname}',
                                style: wm.textTheme.titleLarge,
                              ),
                            ],
                          ),
                        ),
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
              Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Text(
                        'Информация',
                        style: wm.textTheme.titleMedium,
                      ),
                    ),
                    ListTile(
                      title: Text('Сменить личные данные', style: wm.textTheme.bodyLarge,),
                      onTap: () => wm.toEditPersonalInformation(),
                    ),
                    ListTile(
                      title: Text('Сменить пароль', style: wm.textTheme.bodyLarge,),
                      onTap: () => wm.toEditPassword(),
                    ),
                    ListTile(
                      title: Text('Автоматическая смена темы', style: wm.textTheme.bodyLarge,),
                      trailing: EasyDynamicThemeAutoSwitch(),
                    ),
                    ListTile(
                      title: Text('Светлая/темная тема', style: wm.textTheme.bodyLarge,),
                      trailing: EasyDynamicThemeSwitch(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
