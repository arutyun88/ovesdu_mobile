import 'package:injectable/injectable.dart';

import '../../domain/app_config.dart';

@Singleton(as: AppConfig)
@dev
class DevAppConfig implements AppConfig {
  @override
  String get baseUrl => 'localhost';

  @override
  String get host => Environment.dev;
}
