import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';
import 'package:ovesdu_mobile/app/ui/main_app_builder.dart';
import 'package:ovesdu_mobile/app/ui/main_app_runner.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  const env = String.fromEnvironment('env', defaultValue: Environment.prod);
  final runner = MainAppRunner(env);
  final builder = MainAppBuilder();
  runner.run(builder);
}
