import 'package:chirk/models/chirkMessage.dart';
import 'package:chirk/repository/abstract/chirkRepository.dart';

class ChirkRepositoryList extends ChirkRepository{
  final List<Chirk> _chirks = [];

  @override
  Future<void> addChirk(Chirk chirk) async {
    _chirks.add(chirk);
  }

  @override
  Future<void> deleteChirk(Chirk chirk) async{
    _chirks.removeWhere((c) => c.chirkId == chirk.chirkId);
  }

  @override
  Future<List<Chirk>> getChirks({int? userId}) async {
    // здесь может быть логика получения чирков из другого источника, например, базы данных
    if (userId == null) {
      return _chirks;
    } else {
      return _chirks.where((c) => c.user.id == userId).toList();
    }
  }

  @override
  Future<void> updateChirk(Chirk chirk) async{
    final index = _chirks.indexWhere((c) => c.chirkId == chirk.chirkId);
    if (index >= 0) {
      _chirks[index] = chirk;
    }
  }

}