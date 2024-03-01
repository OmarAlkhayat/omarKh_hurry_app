import 'package:dio/dio.dart';

abstract class BaseService {
  Dio dio = Dio();
  String authUrl = 'https://render-qdcy.onrender.com/api';
}
