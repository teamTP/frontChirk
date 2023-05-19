import 'package:chirk/entity/chirk.dart';
import 'package:chirk/service/chirl_list_service.dart';
import 'package:dio/dio.dart';

import '../entity/user.dart';

class ChirkListServiceDIO implements IChirkListService {
  int page = 0;
  final dio = Dio();
  List<Chirk> _chirkList =[];

  ChirkListServiceDIO() {
    page = 0;
    dio.options = BaseOptions(
      baseUrl: "http://10.0.2.2:8080",
      connectTimeout: Duration(milliseconds: 60000),
      receiveTimeout: Duration(milliseconds: 30000),
    );
    //_chirkList = getHttp();
  }

  @override
  List<Chirk> get chirks => _chirkList;

  @override
  void pagination() {
    page++;
    getHttp();
  }

  @override
  void update() {
    page = 0;
    _chirkList = [];
    getHttp();
  }

  Future<List<Chirk>> getHttp() async {
    final response = await dio.get('/feed',
        data: User(
                id: 1,
                login: '',
                password: '',
                iconId: 1,
                name: '',
                surname: '')
            .toFeedJson(page));
    return response.data.map<Chirk>((chirk) => Chirk.fromJson(chirk)).toList();
    _chirkList.addAll(
        response.data.map<Chirk>((chirk) => Chirk.fromJson(chirk)).toList());
  }
}
