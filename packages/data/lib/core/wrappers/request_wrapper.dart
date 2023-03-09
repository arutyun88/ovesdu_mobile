import 'package:dio/dio.dart';

import '../../exceptions/exceptions.dart';
import '../helpers/device_helper.dart';
import '../helpers/app_header.dart';

class RequestWrapper {
  static late final Dio _client;

  RequestWrapper(Dio client) {
    _client = client;
  }

  Future<Map<String, dynamic>> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? header,
  }) async {
    return _responseHandler(
      await send(
        _client.get(path, queryParameters: queryParameters),
      ),
    );
  }

  Future<Map<String, dynamic>> post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? header,
  }) async {
    return _responseHandler(
      await send(
        _client.post(path, queryParameters: queryParameters, data: data),
      ),
    );
  }

  Future<Response<dynamic>> send(
    Future<Response<dynamic>> request, {
    Map<String, dynamic>? header,
  }) async {
    return await request
      ..requestOptions.headers = {
        Headers.contentTypeHeader: Headers.jsonContentType,
        AppHeader.appLocale: DeviceHelper.locale(),
        ...?header,
      };
  }

  Map<String, dynamic> _responseHandler(Response<dynamic> response) {
    if (response.statusCode == 200) return response.data;
    throw _errorHandler(response);
  }

  Exception _errorHandler(Response<dynamic> response) {
    throw ServerException();
  }
}
