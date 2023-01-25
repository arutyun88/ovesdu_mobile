import 'dart:io';

import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: AppConfig)
@dev
class DevAppConfig implements AppConfig {
  @override
  String get baseUrl =>
      Platform.isAndroid ? 'http://10.0.2.2' : 'http://localhost';
}
