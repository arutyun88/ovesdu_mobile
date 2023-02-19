import 'dart:io';

import 'package:domain/domain.dart';

class DevAppConfig implements AppConfig {
  @override
  String get baseUrl =>
      Platform.isAndroid ? 'http://10.0.2.2' : 'http://localhost';
}
