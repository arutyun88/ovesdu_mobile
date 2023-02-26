import 'dart:convert';

import 'package:data/exceptions/exceptions.dart';
import 'package:data/models/name_model.dart';
import 'package:dio/dio.dart';

abstract class AuthenticationRemoteDatasource {
  /// Calls the /auth/info/{[usernameOrEmailOrPhoneNumber]} endpoint
  ///
  /// Throws a [ServerException] for all error codes
  Future<NameModel> getNameIfItExist(String usernameOrEmailOrPhoneNumber);
}

class AuthenticationRemoteDatasourceImpl
    implements AuthenticationRemoteDatasource {
  final Dio _client;

  const AuthenticationRemoteDatasourceImpl({
    required Dio client,
  }) : _client = client;

  @override
  Future<NameModel> getNameIfItExist(
    String usernameOrEmailOrPhoneNumber,
  ) async {
    final response =
        await _client.get('/auth/info/$usernameOrEmailOrPhoneNumber')
          ..requestOptions.headers = {
            Headers.contentTypeHeader: Headers.jsonContentType,
          };
    if (response.statusCode == 200) {
      return NameModel.fromJson(jsonDecode(response.data)['data']);
    } else {
      throw ServerException();
    }
  }
}
