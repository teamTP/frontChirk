import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';

import 'package:chirk/entity/chirk.dart';
import 'package:chirk/model/chirk/chirk_model.dart';
import 'package:chirk/service/userIcons.dart';
import 'package:chirk/widget/chirk/chirk_widget.dart';

class ChirkWM extends WidgetModel<ChirkWidget, ChirkModel>
    implements IChirkWM {
  ChirkWM(super.model);

  @override
  void initWidgetModel() {
    super.initWidgetModel();
  }

  @override
  EntityStateNotifier<Chirk> get chirkState => model.chirkState;

  @override
  void onTapLike() {
    Chirk newChirk = chirkState.value!.data!;

    if (newChirk.liked != null && newChirk.liked!) {
      newChirk.liked = null;
      newChirk.likeCount -= 1;
    } else {
      if (newChirk.liked != null) {
        newChirk.disLikeCount -= 1;
      }
      newChirk.liked = true;
      newChirk.likeCount += 1;
    }
    model.update(newChirk);
  }

  @override
  void onTapDislike() {
    Chirk newChirk = chirkState.value!.data!;
    if (newChirk.liked != null && !newChirk.liked!) {
      newChirk.liked = null;
      newChirk.disLikeCount -= 1;
    } else {
      if (newChirk.liked != null) newChirk.likeCount -= 1;
      newChirk.liked = false;
      newChirk.disLikeCount += 1;
    }
    model.update(newChirk);
  }

  @override
  void dispose() {
    chirkState.dispose();
    super.dispose();
  }

  @override
  AssetImage getImage() {
    return UserIcon.getImageById(chirkState.value!.data!.user.iconId);
  }

  @override
  ThemeData get theme => Theme.of(context);
}

abstract class IChirkWM extends IWidgetModel {
  EntityStateNotifier<Chirk> get chirkState;

  void onTapLike();

  void onTapDislike();

  ThemeData get theme;

  AssetImage getImage();
}
