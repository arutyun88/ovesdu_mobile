import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: AppConfig)
@test
class TestAppConfig implements AppConfig {
  @override
  String get baseUrl => '_';
}
