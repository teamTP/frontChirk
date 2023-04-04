import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class InterfaceTemplate{
  String title;

  InterfaceTemplate(this.title);

  Widget createBody();

}