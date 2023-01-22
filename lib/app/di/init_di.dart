import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'package:di/di.dart' as di;
import 'init_di.config.dart';

final locator = GetIt.instance;

@InjectableInit()
void initDi(String env) {
  $initGetIt(locator, environment: env);
  di.configureDependencies(locator);
}
