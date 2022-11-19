import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../domain/app_api.dart';
import '../domain/app_config.dart';
import 'auth_interceptor.dart';

@Singleton(as: AppApi)
class DioAppApi implements AppApi {
  late final Dio dio;

  DioAppApi(AppConfig appConfig) {
    final options = BaseOptions(
      baseUrl: appConfig.baseUrl,
      connectTimeout: 15000,
    );
    dio = Dio(options);
    if (kDebugMode) _addInterceptor(PrettyDioLogger());
    _addInterceptor(AuthInterceptor());
  }

  void _addInterceptor(Interceptor interceptor) {
    if (dio.interceptors.contains(interceptor)) {
      dio.interceptors.remove(interceptor);
    }
    _deleteInterceptor(interceptor.runtimeType);
    dio.interceptors.add(interceptor);
  }

  void _deleteInterceptor(Type type) {
    dio.interceptors.removeWhere((element) => element.runtimeType == type);
  }

  @override
  Future<void> setHeaderLocale() async {
    final settings = await Hive.openBox('settings');
    var locale = settings.get('locale');
    dio.options.headers.addEntries(
      {
        'locale': locale,
      }.entries,
    );
  }

  @override
  Future<Response> request(String path) {
    try {
      return dio.request(path);
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<Response> fetch(RequestOptions requestOptions) {
    try {
      return dio.fetch(requestOptions);
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<Response> checkContact(Map<String, dynamic> data) {
    try {
      return dio.post('/auth/check', data: data);
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<Response> checkUsername(String username) {
    try {
      return dio.get('/auth/check/$username');
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<Response> getName(Map<String, dynamic> data) {
    try {
      return dio.post('/auth/info', data: data);
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<Response> refreshToken(String? refreshToken) {
    try {
      return dio.post('/auth/token/$refreshToken');
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<Response> signIn(Map<String, dynamic> data) {
    try {
      return dio.post('/auth/token', data: data);
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<Response> signUp(Map<String, dynamic> data) {
    try {
      return dio.put('/auth/token', data: data);
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<Response> getLocations(String query) {
    try {
      return dio.get('/library/location/$query');
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<Response> saveLocation(Map<String, dynamic> data) {
    try {
      return dio.put('/library/location', queryParameters: data);
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<Response> searchLocations(String query) {
    try {
      return dio.post('/library/location/$query');
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<Response> getProfile() {
    try {
      return dio.get('/auth/user');
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<Response> getUserProfile(String userId) {
    try {
      return dio.get(
        '/auth/profile',
        queryParameters: {'userId': userId},
      );
    } catch (_) {
      rethrow;
    }
  }
}
