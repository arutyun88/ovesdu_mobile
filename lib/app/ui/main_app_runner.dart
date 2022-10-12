import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:ovesdu_mobile/app/di/init_di.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

import '../domain/app_builder.dart';
import '../domain/app_runner.dart';

class MainAppRunner implements AppRunner {
  String locale = Platform.localeName.split('_').first;
  bool isLightTheme = false;

  final String env;

  MainAppRunner(this.env);

  @override
  Future<void> preloadData() async {
    WidgetsFlutterBinding.ensureInitialized();
    initDi(env);

    final appDocumentDirectory =
        await path_provider.getApplicationDocumentsDirectory();
    Hive.init(appDocumentDirectory.path);
    final settings = await Hive.openBox('settings');
    String? setLocal = settings.get('locale');
    bool? setTheme = settings.get('lightTheme');
    if (setLocal != null) {
      locale = setLocal;
    }
    if (setTheme != null) {
      isLightTheme = setTheme;
    }
  }

  @override
  Future<void> run(AppBuilder appBuilder) async {
    await preloadData();
    runApp(appBuilder.buildApp(locale, isLightTheme));
    log(env);
  }
}
