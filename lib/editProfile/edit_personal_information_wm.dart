import 'package:chirk/editProfile/edit_personal_information_widget.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/cupertino.dart';

import '../entity/user.dart';
import 'edit_personal_information_model.dart';
class EditPersonalInformationWM extends WidgetModel<EditPersonalInformationWidget, EditPersonalInformationModel> implements IEditPersonalInformationWM{
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final Key _key = GlobalKey<FormState>();
  bool _isFirstNameValid = true;
  bool _isLastNameValid = true;
  EntityStateNotifier<User> _userState = EntityStateNotifier();

  EditPersonalInformationWM(super.model){
    _nameController.text = model.oldUser.name;
    _surnameController.text = model.oldUser.surname;
    _userState.content(model.oldUser);
  }
  @override
  void editInf() {
    if(_validateName()&& _validateSurname()){
      model.editInf(_nameController.text,  _surnameController.text).then((value){
        model.oldUser.name = _nameController.text;
        model.oldUser.surname = _surnameController.text;
        Navigator.pop(context, model.oldUser);
      });
    }

  }

  @override
  TextEditingController get nameController =>_nameController;

  @override
  TextEditingController get surnameController => _surnameController;

  @override
  void cancel() {
    Navigator.pop(context);
  }

  @override
  Key get key => _key;

  bool _validateName() {
    bool isValid = _nameController.text.isNotEmpty;
    _isFirstNameValid = isValid;
    _userState.content(model.oldUser);
    return isValid;
  }
  bool _validateSurname() {
    bool isValid = _surnameController.text.isNotEmpty;
    _isLastNameValid = isValid;
    _userState.content(model.oldUser);
    return isValid;
  }

  @override
  EntityStateNotifier<User> get userState => _userState;

  @override
  bool get isFirstNameValid =>_isFirstNameValid;

  @override
  bool get isLastNameValid => _isLastNameValid;

}
abstract class IEditPersonalInformationWM extends IWidgetModel{
  TextEditingController get nameController;
  TextEditingController get surnameController;
  EntityStateNotifier<User> get userState;
  bool get isFirstNameValid;
  bool get isLastNameValid;

  Key get key;
  void editInf();
  void cancel();

}
