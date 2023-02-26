import 'dart:io';

import 'package:dio/dio.dart';

abstract class AppClient implements Dio {
  static final instance = Dio(BaseOptions(
    baseUrl: Platform.isAndroid ? 'http://10.0.2.2' : 'http://localhost',
    connectTimeout: 15000,
  ));
}
