import 'package:dio/dio.dart';
import 'package:domain/domain.dart';
import 'package:get_it/get_it.dart';

class AuthInterceptor extends QueuedInterceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final accessToken = GetIt.I.get<AuthCubit>().state.whenOrNull(
          authorized: (tokens) => tokens.accessToken,
        );
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
        await GetIt.I.get<AuthCubit>().refreshToken();
        final response = await GetIt.I.get<AppApi>().fetch(err.requestOptions);
        return handler.resolve(response);
      } catch (_) {
        super.onError(err, handler);
      }
    } else {
      super.onError(err, handler);
    }
  }
}
