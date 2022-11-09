import 'package:injectable/injectable.dart';

import '../../domain/app_config.dart';

@Singleton(as: AppConfig)
@prod
class ProdAppConfig implements AppConfig {
  @override
  String get baseUrl => 'http://82.146.40.223';

  @override
  String get host => Environment.prod;
}
