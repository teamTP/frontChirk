import 'package:chirk/editProfile/edit_password_model/edit_password_model.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/cupertino.dart';

import 'edit_password_widget.dart';
class EditPasswordWM extends WidgetModel<EditPasswordWidget, EditPasswordModel> implements IEditPasswordWM{
  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _newPasswordRetryController = TextEditingController();
  final Key _key = GlobalKey<FormState>();
  EditPasswordWM(super.model);
  @override
  void editInf() {
    model.editPas().then((value){
      Navigator.pop(context);
    });
  }

  @override
  void cancel() {
    Navigator.pop(context);
  }

  @override
  Key get key => _key;

  @override
  void editPas() {
    model.editPas();
  }

  @override
  TextEditingController get newPasswordController => _newPasswordController;

  @override
  TextEditingController get newPasswordRetryController => _newPasswordRetryController;

  @override
  TextEditingController get oldPasswordController => _oldPasswordController;


}
abstract class IEditPasswordWM extends IWidgetModel{
  TextEditingController get oldPasswordController;
  TextEditingController get newPasswordController;
  TextEditingController get newPasswordRetryController;

  Key get key;
  void editPas();
  void cancel();

}
