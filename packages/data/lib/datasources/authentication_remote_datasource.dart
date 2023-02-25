import 'dart:convert';

import 'package:data/exceptions/exceptions.dart';
import 'package:data/models/name_model.dart';
import 'package:http/http.dart' as http;

abstract class AuthenticationRemoteDatasource {
  /// Calls the /auth/info/{[usernameOrEmailOrPhoneNumber]} endpoint
  ///
  /// Throws a [ServerException] for all error codes
  Future<NameModel> getNameIfItExist(String usernameOrEmailOrPhoneNumber);
}

class AuthenticationRemoteDatasourceImpl
    implements AuthenticationRemoteDatasource {
  final http.Client _client;

  const AuthenticationRemoteDatasourceImpl({
    required http.Client client,
  }) : _client = client;

  @override
  Future<NameModel> getNameIfItExist(
    String usernameOrEmailOrPhoneNumber,
  ) async {
    final response = await _client.get(
      Uri(path: '/auth/info/$usernameOrEmailOrPhoneNumber'),
      headers: {'Content-Type': 'application/json'},
    );
    if(response.statusCode == 200) {
      return NameModel.fromJson(jsonDecode(response.body)['data']);
    } else {
      throw ServerException();
    }
  }
}
