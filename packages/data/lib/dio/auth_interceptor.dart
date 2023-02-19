import 'package:dio/dio.dart';
import 'package:domain/domain.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';

class AuthInterceptor extends QueuedInterceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    await _setHeaderLocale(options);
    super.onRequest(_setAuthToken(options), handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      try {
        await GetIt.I.get<AuthCubit>().refreshToken();
        final response = await GetIt.I.get<ApiDio>().fetch(
              err.requestOptions,
            );
        return handler.resolve(response);
      } catch (_) {
        super.onError(err, handler);
      }
    } else {
      super.onError(err, handler);
    }
  }

  RequestOptions _setAuthToken(RequestOptions options) {
    final accessToken = GetIt.I.get<AuthCubit>().state.whenOrNull(
          authorized: (tokens) => tokens.accessToken,
        );
    if (accessToken == null) {
      return options;
    } else {
      final headers = options.headers;
      headers['Authorization'] = 'Bearer $accessToken';
      return options.copyWith(headers: headers);
    }
  }

  Future<void> _setHeaderLocale(RequestOptions options) async {
    final settings = await Hive.openBox('settings');
    options.headers.addEntries({'locale': settings.get('locale')}.entries);
  }
}
