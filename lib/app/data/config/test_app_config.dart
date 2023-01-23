import 'package:injectable/injectable.dart';

import '../../domain/app_config.dart';

@Singleton(as: AppConfig)
@test
class TestAppConfig implements AppConfig {
  @override
  String get baseUrl => '_';

  @override
  String get host => Environment.test;
}
