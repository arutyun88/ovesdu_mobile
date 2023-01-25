import 'package:dio/dio.dart';
import 'package:domain/domain.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:ovesdu_mobile/app/data/auth_interceptor.dart';
import 'package:ovesdu_mobile/app/domain/auth_api.dart';

@Singleton(as: AuthApi)
class DioAuthApi implements AuthApi {
  final ApiDio _api;

  DioAuthApi(ApiDio api) : _api = api {
    _addInterceptor(AuthInterceptor());
  }

  void _addInterceptor(Interceptor interceptor) {
    if (_api.dio.interceptors.contains(interceptor)) {
      _api.dio.interceptors.remove(interceptor);
    }
    _deleteInterceptor(interceptor.runtimeType);
    _api.dio.interceptors.add(interceptor);
  }

  void _deleteInterceptor(Type type) {
    _api.dio.interceptors.removeWhere((element) => element.runtimeType == type);
  }

  @override
  Future<void> setHeaderLocale() async {
    final settings = await Hive.openBox('settings');
    var locale = settings.get('locale');
    _api.dio.options.headers.addEntries(
      {
        'locale': locale,
      }.entries,
    );
  }

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
