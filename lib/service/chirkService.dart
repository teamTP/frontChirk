import 'package:chirk/repository/abstract/chirkRepository.dart';

import '../models/chirkMessage.dart';

class ChirkService {
  final ChirkRepository _repository;

  ChirkService(this._repository);

  Future<List<Chirk>> getChirks() async {
    return _repository.getChirks();
  }

  Future<void> addChirk(Chirk chirk) async {
    await _repository.addChirk(chirk);
  }

  Future<void> updateChirk(Chirk chirk) async {
    await _repository.updateChirk(chirk);
  }

  Future<void> deleteChirk(Chirk chirk) async {
    await _repository.deleteChirk(chirk);
  }
}