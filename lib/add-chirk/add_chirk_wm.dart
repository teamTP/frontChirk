import 'package:chirk/add-chirk/add_chirk_model.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/cupertino.dart';

import 'add_chirk_widget.dart';

class AddChirkWM extends WidgetModel<AddChirkWidget, AddChirkModel> implements IAddChirkWM{
  AddChirkWM(super.model);
  final TextEditingController _messageController = TextEditingController();
  final EntityStateNotifier<bool> _disappearState = EntityStateNotifier();
  @override
  Future<void> addChirk() async{
    if(_validateMessage()){
      model.addChirk(_messageController.text).then((value){
        _messageController.text  = '';
        model.isDisappear = false;
        _disappearState.content(model.isDisappear);
      });

    }
    // TODO: implement addChirk
    throw UnimplementedError();
  }

  @override
  get isDisappear => model.isDisappear;

  @override
  TextEditingController get messageController => _messageController;

  @override
  void onTapCheck() {
    model.isDisappear=!model.isDisappear;
    _disappearState.content(model.isDisappear);
  }

  bool _validateMessage() {
    return _messageController.text.length<255 && _messageController.text.isNotEmpty;
  }

  @override
  // TODO: implement disapperState
  EntityStateNotifier<bool> get disappearState => _disappearState;


}

abstract class IAddChirkWM extends IWidgetModel{
  get messageController;

  EntityStateNotifier<bool> get disappearState;
  Future<void> addChirk();
  get isDisappear;

  void onTapCheck();
}