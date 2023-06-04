import 'package:chirk/widget/profile/edit_profile_widget.dart';
import 'package:chirk/model/profile/profile_model.dart';
import 'package:chirk/widget/profile/profile_widget.dart';
import 'package:chirk/widgetModel/profile/edit_profile_wm.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../entity/user.dart';
import '../../provider/user_provider.dart';
import '../../service/user_icons.dart';

class ProfileWM extends WidgetModel<ProfileWidget, ProfileModel>
    implements IProfileWM {
  ProfileWM(super.model);

  @override
  void toDislikeFeed() {
    Navigator.of(context).pushNamed("/dislikedChirk");
  }

  @override
  void toEditProfile() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                EditProfileWidget((context) => EditProfileWM(model))));
  }

  @override
  void toExit() {
    _showExitDialog();
  }

  Future<void> _showExitDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Выход'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Вы точно хотите выйти?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Да'),
              onPressed: () {
                final tokenProvider =
                    Provider.of<TokenProvider>(context, listen: false);
                tokenProvider.deleteTokens();
                Navigator.of(context).pop();
                //Navigator.pushNamedAndRemoveUntil(context, "/login", (root)=>root.isFirst);
              },
            ),
            TextButton(
              child: const Text('Нет'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
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
  get userState => model.userState;
}

abstract class IProfileWM extends IWidgetModel {
  get userIcon;

  EntityStateNotifier<User> get userState;

  void toLikeFeed();

  void toDislikeFeed();

  void toMyFeed();

  void toExit();

  void toEditProfile();

  TextTheme get textTheme;
}
