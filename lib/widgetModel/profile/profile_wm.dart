import 'package:chirk/model/profile/profile_model.dart';
import 'package:chirk/widget/profile/profile_widget.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../entity/user.dart';
import '../../provider/user_provider.dart';
import '../../service/userIcons.dart';


class ProfileWM extends WidgetModel<ProfileWidget, ProfileModel> implements IProfileWM{
  ProfileWM(super.model);

  @override
  void toDislikeFeed() {
    Navigator.of(context).pushNamed("/dislikedChirk");
  }

  @override
  void toEditProfile() {
    Navigator.pushNamed(context, "/edit");
  }

  @override
  void toExit() {
    //todo сделать всплывающее окно
    final tokenProvider = Provider.of<TokenProvider>(context, listen: false);
    tokenProvider.deleteTokens();
    Navigator.pushNamed(context, "/login");
  }

  @override
  void toLikeFeed() {
    Navigator.of(context).pushNamed("/likedChirk");
  }

  @override
  void toMyFeed() {
    Navigator.of(context).pushNamed("/myChirk");
  }

  @override
  TextTheme get textTheme => Theme.of(context).textTheme;

  @override
  get userIcon => UserIcon.getImageById(userState.value!.data!.iconId);

  @override
  // TODO: implement userState
  get userState => model.userState;
}
abstract class IProfileWM extends IWidgetModel{
  get userIcon;

  EntityStateNotifier<User> get userState;

  void toLikeFeed();
  void toDislikeFeed();
  void toMyFeed();

  void toExit();
  void toEditProfile();
  TextTheme get textTheme;
}