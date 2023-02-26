import 'package:data/exceptions/exceptions.dart';
import 'package:dio/dio.dart';

class RequestWrapper {
  static late final Dio _client;

  RequestWrapper(Dio client) {
    _client = client;
  }

  Future<Map<String, dynamic>> get(
    String path, {
    Map? queryParameters,
  }) async {
    final result = await _client.get(path)
      ..requestOptions.headers = {
        Headers.contentTypeHeader: Headers.jsonContentType,
      };
    if (result.statusCode == 200) {
      return result.data;
    } else {
      throw ServerException();
    }
  }
}
