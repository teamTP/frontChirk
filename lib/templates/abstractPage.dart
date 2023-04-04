import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class AbstractPage extends StatefulWidget {
  String title;

  AbstractPage(this.title, {super.key});
}
