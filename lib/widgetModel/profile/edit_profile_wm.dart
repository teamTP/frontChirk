import 'package:chirk/editProfile/edit_password_model/edit_password_model.dart';
import 'package:chirk/editProfile/edit_password_model/edit_password_widget.dart';
import 'package:chirk/editProfile/edit_password_model/edit_password_wm.dart';
import 'package:chirk/editProfile/edit_personal_information_model.dart';
import 'package:chirk/editProfile/edit_personal_information_widget.dart';
import 'package:chirk/editProfile/edit_personal_information_wm.dart';
import 'package:chirk/model/profile/profile_model.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';

import '../../widget/profile/edit_profile_widget.dart';
import '../../entity/user.dart';
import '../../service/userIcons.dart';

class EditProfileWM extends WidgetModel<EditProfileWidget, ProfileModel>
    implements IEditProfileWM {
  EditProfileWM(super.model);

  @override
  void toEditPassword() {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => EditPasswordWidget(
            (context) => EditPasswordWM(EditPasswordModel()))));
  }

  @override
  void toEditPersonalInformation() {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => EditPersonalInformationWidget((context) =>
            EditPersonalInformationWM(
                EditPersonalInformationModel(model.userState.value!.data!))))).then((value){
                  model.userState.content(value);
    });
  }

  @override
  EntityStateNotifier<User> get userState => model.userState;

  @override
  TextTheme get textTheme => Theme.of(context).textTheme;

  @override
  get userIcon => UserIcon.getImageById(userState.value!.data!.iconId);
}

abstract class IEditProfileWM extends IWidgetModel {
  void toEditPersonalInformation();

  void toEditPassword();

  EntityStateNotifier<User> get userState;

  get userIcon;

  TextTheme get textTheme;
}
