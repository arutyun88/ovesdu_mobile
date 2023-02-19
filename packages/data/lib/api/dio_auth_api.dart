import 'package:dio/dio.dart';
import 'package:domain/domain.dart';

class DioAuthApi implements AuthApi {
  final ApiDio _api;

  DioAuthApi(ApiDio api) : _api = api;

  @override
  Future<Response> checkContact(Map<String, dynamic> data) {
    try {
      return _api.dio.post('/auth/check', data: data);
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<Response> checkUsername(String username) {
    try {
      return _api.dio.get('/auth/check/$username');
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<Response> getName(Map<String, dynamic> data) {
    try {
      return _api.dio.post('/auth/info', data: data);
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<Response> refreshToken(String? refreshToken) {
    try {
      return _api.dio.post('/auth/token/$refreshToken');
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<Response> signIn(Map<String, dynamic> data) {
    try {
      return _api.dio.post('/auth/token', data: data);
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<Response> signUp(Map<String, dynamic> data) {
    try {
      return _api.dio.put('/auth/token', data: data);
    } catch (_) {
      rethrow;
    }
  }
}
