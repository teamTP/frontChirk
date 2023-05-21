import 'package:flutter/material.dart';

class UserIcon {
  static final Map<int, String> images= {
    0: 'assets/img/icon_01.png',
    1: 'assets/img/icon_02.png',
    2: 'assets/img/icon_03.png',
    3: 'assets/img/icon_04.png',
    4: 'assets/img/icon_05.png',

  };


  static AssetImage getImageById(int index){
    return AssetImage(images[index]??'assets/img/icon_01.png');
  }

}