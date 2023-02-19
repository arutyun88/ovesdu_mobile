import 'package:dio/dio.dart';

abstract class ApiDio {
  Dio get dio;

  Future<Response> fetch(RequestOptions requestOptions);
}
