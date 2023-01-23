import 'package:get_it/get_it.dart';

import 'package:domain/domain.dart' as domain;
import 'package:data/data.dart' as data;

void configureDependencies(GetIt instance) {
  domain.configureDependencies(instance);
  data.configureDependencies(instance);
}
