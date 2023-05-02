import 'package:elementary/elementary.dart';
import 'package:flutter/cupertino.dart';

import '../entity/chirk.dart';
import '../model/chirk_model.dart';
import '../service/userIcons.dart';
import '../widget/chirk_widget/chirk_widget_el.dart';

class ChirkWM extends WidgetModel<ChirkWidgetEl, ChirkModel> implements IChirkWM{
  ChirkWM(super.model);
  @override
  final EntityStateNotifier<Chirk> chirkState = EntityStateNotifier();


  @override
  void initWidgetModel() {
    super.initWidgetModel();
  }

  @override
  Chirk get chirk =>model.chirk;

  @override
  void onTapLike() {
    Chirk newChirk = chirk;
    if(newChirk.liked==null || !newChirk.liked!){
      newChirk.liked = true;
      chirk = newChirk;
    }else{
      newChirk.liked=null;
      chirk = newChirk;
    }
    // TODO: implement onTabChirkDislike
  }

  @override
  void onTapDislike() {
    Chirk newChirk = chirk;
    if(newChirk.liked==null || newChirk.liked!){
      newChirk.liked=false;
      chirk = newChirk;
    }else{
      newChirk.liked=null;
      chirk = newChirk;
    }
    chirkState.content(chirk);
    // TODO: implement onTapChirkLike
  }

  @override
  void dispose() {
    chirkState.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  AssetImage getImage() {
    return UserIcon.getImageById(chirk.user.iconId);
  }
  @override
  set chirk(Chirk value)=> model.chirk= value;

}

abstract class IChirkWM extends IWidgetModel{
  Chirk get chirk;
  set chirk(Chirk value);
  EntityStateNotifier<Chirk> get chirkState;

  void onTapLike();

  void onTapDislike();

  AssetImage getImage();


}