import 'package:dio/dio.dart';

class BoardService {
  static final BoardService instance = BoardService._internal();
  factory BoardService()=>instance;
  BoardService._internal() {
    dio.options = BaseOptions(
      baseUrl: ""
    );
  }

  final dio = Dio();
}



