import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class AbstractBody {
  String title;

  AbstractBody(this.title);

  Widget createBody();
}
