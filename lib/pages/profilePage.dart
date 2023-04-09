import 'package:chirk/templates/abstractPage.dart';
import 'package:chirk/templates/abstractStandartState.dart';
import 'package:chirk/templates/bodyTemplates/profileBody.dart';
import 'package:flutter/material.dart';

class ProfilePage extends AbstractPage {
  ProfilePage() : super('Профиль');

  @override
  State<StatefulWidget> createState() => _profileState(title);
}

class _profileState extends AbstractNavigationState {
  _profileState(super.title);

  @override
  Widget createBody() {
    return ProfileBody.addProfileBody();
  }
}
