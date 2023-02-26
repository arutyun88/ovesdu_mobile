import 'dart:io';

import 'package:data/exceptions/exceptions.dart';
import 'package:dio/dio.dart';

const debugMode = !bool.fromEnvironment('dart.vm.product') &&
    !bool.fromEnvironment('dart.vm.profile');

class RequestWrapper {
  static late final Dio _client;

  Dio get client => _client;

  static final instance = RequestWrapper._();

  static testInstance(Dio client) => RequestWrapper._(testClient: client);

  RequestWrapper._({Dio? testClient}) {
    if (testClient == null) {
      final options = BaseOptions(
        baseUrl: Platform.isAndroid ? 'http://10.0.2.2' : 'http://localhost',
        connectTimeout: 15000,
      );
      _client = Dio(options);
    } else {
      _client = testClient;
    }
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
