import 'package:get_it/get_it.dart';

import 'package:di/di.dart' as di;
import 'package:injectable/injectable.dart';
import 'init_di.config.dart';

final locator = GetIt.instance;

@InjectableInit()
void initDi(String env) {
  di.configureDependencies(locator, env);
  $initGetIt(locator, environment: env);
}
