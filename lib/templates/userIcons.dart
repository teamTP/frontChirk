import 'package:flutter/material.dart';

class UserIcon {
  static final Map<int, String> images= {
    0: 'img/hasta.jpg',
    1: 'img/hasta.jpg',
    2: 'img/hasta.jpg',
  };


  static AssetImage getImageById(int index){
    return AssetImage(images[index]??'img/hasta.jpg');
  }

}