import 'package:chirk/editProfile/edit_personal_information_widget.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/cupertino.dart';

import 'edit_personal_information_model.dart';
class EditPersonalInformationWM extends WidgetModel<EditPersonalInformationWidget, EditPersonalInformationModel> implements IEditPersonalInformationWM{
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final Key _key = GlobalKey<FormState>();
  EditPersonalInformationWM(super.model){
    _nameController.text = model.oldUser.name;
    _surnameController.text = model.oldUser.surname;
  }
  @override
  void editInf() {
    model.editInf().then((value){
      Navigator.pop(context);
    });
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


}
abstract class IEditPersonalInformationWM extends IWidgetModel{
  TextEditingController get nameController;
  TextEditingController get surnameController;

  Key get key;
  void editInf();
  void cancel();

}
