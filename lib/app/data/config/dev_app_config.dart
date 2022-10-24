import 'dart:io';

import 'package:injectable/injectable.dart';

import '../../domain/app_config.dart';

@Singleton(as: AppConfig)
@dev
class DevAppConfig implements AppConfig {
  @override
  String get baseUrl =>
      Platform.isAndroid ? 'http://10.0.2.2' : 'http://localhost';

  @override
  String get host => Environment.dev;
}
