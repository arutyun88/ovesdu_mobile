import 'package:dio/dio.dart';

abstract class AuthApi {
  Future<void> setHeaderLocale();

  Future<Response> getName(Map<String, dynamic> data);

  Future<Response> checkUsername(String username);

  Future<Response> checkContact(Map<String, dynamic> data);

  Future<Response> signIn(Map<String, dynamic> data);

  Future<Response> signUp(Map<String, dynamic> data);

  Future<Response> refreshToken(String? refreshToken);
}
