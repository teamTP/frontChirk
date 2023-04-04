import 'package:chirk/activities/new%20test/interfaceTemplate.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/diagnostics.dart';

abstract class AbstractActivity extends StatefulWidget{
  String title;

  AbstractActivity(this.title, {super.key});

}
