import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';

import '../entity/chirk.dart';

class ChirkModel extends ElementaryModel {
  IChirkService _chirkService;

  ChirkModel(this._chirkService);

  Chirk get chirk => _chirkService.chirk;

  set chirk(Chirk value) {
    _chirkService.chirk = value;
  }
}

abstract class IChirkService {
  Chirk get chirk;
  set chirk(Chirk value);
}
class ChirkService implements IChirkService{

  Chirk _chirk;

  ChirkService(this._chirk);
@override
  Chirk get chirk => _chirk;
@override
  set chirk(Chirk value) {
    _chirk = value;
  }
}