import 'package:chirk/model/profile/profile_model.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';

import '../../editProfile/edit_profile_widget.dart';
import '../../entity/user.dart';
import '../../service/userIcons.dart';

class EditProfileWM extends WidgetModel<EditProfileWidget, ProfileModel>
    implements IEditProfileWM {
  EditProfileWM(super.model);

  @override
  void toEditIcon() {
    Navigator.of(context).pushNamed('/editIcon');
  }

  @override
  void toEditPassword() {
    Navigator.of(context).pushNamed('/editPassword');
  }

  @override
  void toEditPersonalInformation() {
    Navigator.of(context).pushNamed('/editPersonalInformation');
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

  void toEditIcon();

  EntityStateNotifier<User> get userState;

  get userIcon;

  TextTheme get textTheme;
}
