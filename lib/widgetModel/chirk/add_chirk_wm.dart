import 'package:chirk/model/chirk/add_chirk_model.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widget/chirk/add_chirk_widget.dart';

class AddChirkWM extends WidgetModel<AddChirkWidget, AddChirkModel>
    implements IAddChirkWM {

  final TextEditingController _messageController = TextEditingController();
  final EntityStateNotifier<bool> _disappearState = EntityStateNotifier();

  AddChirkWM(super.model);
  @override
  Future<void> addChirk() async {
    if (_validateMessage()) {
      model.addChirk(_messageController.text).then((value) {

        if(value==''){
          _messageController.text = '';
          model.isDisappear = false;
          _disappearState.content(model.isDisappear);
        }else{
          final snackBar = SnackBar(
            content: Text(value),
            duration: Duration(seconds: 3),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }

      });
    }
  }

  @override
  get isDisappear => model.isDisappear;

  @override
  TextEditingController get messageController => _messageController;

  @override
  void onTapCheck() {
    model.isDisappear = !model.isDisappear;
    _disappearState.content(model.isDisappear);
  }

  bool _validateMessage() {
    return _messageController.text.length <= 255 &&
        _messageController.text.isNotEmpty;
  }

  @override
  EntityStateNotifier<bool> get disappearState => _disappearState;

}

abstract class IAddChirkWM extends IWidgetModel {
  get messageController;

  EntityStateNotifier<bool> get disappearState;


  Future<void> addChirk();

  get isDisappear;

  void onTapCheck();
}
