import 'package:dio/dio.dart';
import 'package:hive/hive.dart';

import '../../feature/auth/domain/state/auth_cubit.dart';
import '../di/init_di.dart';
import '../domain/app_api.dart';

class AuthInterceptor extends QueuedInterceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final tokenEntity = await Hive.openBox('hydrated_box');
    final accessToken =
        tokenEntity.get('AuthCubit')['tokenEntity']['accessToken'];
    if (accessToken == null) {
      super.onRequest(options, handler);
    } else {
      final headers = options.headers;
      headers['Authorization'] = 'Bearer $accessToken';
      super.onRequest(options.copyWith(headers: headers), handler);
    }
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      try {
        await locator.get<AuthCubit>().refreshToken();
        final response = await locator.get<AppApi>().fetch(err.requestOptions);
        return handler.resolve(response);
      } catch (_) {
        super.onError(err, handler);
      }
    } else {
      super.onError(err, handler);
    }
  }
}
