import 'package:flutter/material.dart';

class UserIcon {
  static final Map<int, String> images= {
    0: 'assets/img/icon_1.png',
    1: 'assets/img/icon_1.png',
    2: 'assets/img/icon_1.png',
  };


  static AssetImage getImageById(int index){
    return AssetImage(images[index]??'assets/img/icon_1.png');
  }

}