import 'package:chirk/models/chirkMessage.dart';

abstract class ChirkRepository{
  Future<List<Chirk>> getChirks();
  Future<void> addChirk(Chirk chirk);
  Future<void> updateChirk(Chirk chirk);
  Future<void> deleteChirk(Chirk chirk);
}