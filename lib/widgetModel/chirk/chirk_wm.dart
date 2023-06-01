import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';

import 'package:chirk/entity/chirk.dart';
import 'package:chirk/model/chirk/chirk_model.dart';
import 'package:chirk/service/userIcons.dart';
import 'package:chirk/widget/chirk/chirk_widget.dart';

class ChirkWM extends WidgetModel<ChirkWidget, ChirkModel>
    implements IChirkWM {
  EntityStateNotifier<bool> _deletedState = EntityStateNotifier();
  @override
  void initWidgetModel() {
    super.initWidgetModel();
  }

  ChirkWM(super.model){
    _deletedState.content(false);
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

  @override
  void toTapDelete() {
    _showMyDialog();
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Вы точно хотите удалить чирк?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Да'),
              onPressed: () {
                _deleteChirk().then((value){
                  Navigator.of(context).pop();
                });
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
  Future<void> _deleteChirk()async {
     model.delete();
    _deletedState.content(true);

  }

  @override
  EntityStateNotifier<bool> get deletedState => _deletedState;

}

abstract class IChirkWM extends IWidgetModel {
  EntityStateNotifier<Chirk> get chirkState;

  EntityStateNotifier<bool> get deletedState;

  void onTapLike();

  void onTapDislike();

  ThemeData get theme;

  AssetImage getImage();

  void toTapDelete();
}
