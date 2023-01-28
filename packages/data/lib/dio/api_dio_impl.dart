import 'package:dio/dio.dart';
import 'package:domain/domain.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

const debugMode = !bool.fromEnvironment('dart.vm.product') &&
    !bool.fromEnvironment('dart.vm.profile');

class ApiDioImpl implements ApiDio {
  late final Dio _dio;

  @override
  Dio get dio => _dio;

  ApiDioImpl(AppConfig appConfig) {
    final options = BaseOptions(
      baseUrl: appConfig.baseUrl,
      connectTimeout: 15000,
    );
    _dio = Dio(options);
    if (debugMode) _addInterceptor(PrettyDioLogger());
  }

  void _addInterceptor(Interceptor interceptor) {
    if (_dio.interceptors.contains(interceptor)) {
      _dio.interceptors.remove(interceptor);
    }
    _deleteInterceptor(interceptor.runtimeType);
    _dio.interceptors.add(interceptor);
  }

  void _deleteInterceptor(Type type) {
    _dio.interceptors.removeWhere((element) => element.runtimeType == type);
  }
}
