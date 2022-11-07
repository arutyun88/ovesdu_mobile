import 'package:injectable/injectable.dart';
import 'package:ovesdu_mobile/app/ui/main_app_builder.dart';
import 'package:ovesdu_mobile/app/ui/main_app_runner.dart';

void main() async {
  const env = String.fromEnvironment('env', defaultValue: Environment.dev);
  final runner = MainAppRunner(env);
  final builder = MainAppBuilder();
  runner.run(builder);
}
