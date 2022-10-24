import 'dart:developer';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

import '../di/init_di.dart';
import '../domain/app_builder.dart';
import '../domain/app_runner.dart';
import '../domain/entities/device_entity/device_entity.dart';

class MainAppRunner implements AppRunner {
  String locale = Platform.localeName.split('_').first;
  bool isLightTheme = false;
  late DeviceEntity device;

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
    locale = settings.get('locale') ?? locale;
    isLightTheme = settings.get('lightTheme') ?? isLightTheme;
    device = await _getDeviceInfo();
  }

  @override
  Future<void> run(AppBuilder appBuilder) async {
    await preloadData();
    runApp(appBuilder.buildApp(locale, isLightTheme, device));
    log(env);
  }

  Future<DeviceEntity> _getDeviceInfo() async {
    late String deviceType = '';
    late String deviceId = '';
    final DeviceInfoPlugin device = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      deviceType = 'android';
      var deviceInfo = await device.androidInfo;
      deviceId = deviceInfo.id;
    } else if (Platform.isIOS) {
      deviceType = 'ios';
      var deviceInfo = await device.iosInfo;
      deviceId = deviceInfo.identifierForVendor ?? '';
    } else {
      deviceType = 'other';
      deviceId = 'other';
    }

    return DeviceEntity(deviceType: deviceType, deviceId: deviceId);
  }
}
