import 'dart:developer';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:domain/entity/device_entity/device_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:hive/hive.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

import '../di/init_di.dart';
import '../domain/app_builder.dart';
import '../domain/app_runner.dart';
import '../helpers/setting_key.dart';

class MainAppRunner implements AppRunner {
  late String locale;
  late bool isLightTheme;
  late DeviceEntity device;
  late bool firstStart;
  late bool isCircleAvatar;
  late Directory directory;

  final String env;

  MainAppRunner(this.env);

  @override
  Future<void> preloadData() async {
    directory = await path_provider.getApplicationDocumentsDirectory();
    Hive.init(directory.path);
    final settings = await Hive.openBox(SettingKey.settings);

    locale = settings.get(SettingKey.locale) ??
        _setSetting(
          settings,
          SettingKey.locale,
          Platform.localeName.split('_').first,
        );

    isLightTheme = settings.get(SettingKey.theme) ??
        _setSetting(
          settings,
          SettingKey.theme,
          SchedulerBinding.instance.window.platformBrightness ==
              Brightness.light,
        );

    isCircleAvatar = settings.get(SettingKey.avatar) ??
        _setSetting(
          settings,
          SettingKey.avatar,
          false,
        );

    device = await _getDeviceInfo();

    firstStart = settings.get(SettingKey.firstStart) ?? true;
    _setSetting(
      settings,
      SettingKey.firstStart,
      false,
    );
  }

  @override
  Future<void> run(AppBuilder appBuilder) async {
    await preloadData();
    final storage = await HydratedStorage.build(storageDirectory: directory);
    HydratedBlocOverrides.runZoned(
      () async {
        initDi(env);
        runApp(
          appBuilder.buildApp(
            locale,
            isLightTheme,
            device,
            firstStart,
            isCircleAvatar,
          ),
        );
      },
      storage: storage,
    );
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

  dynamic _setSetting(Box<dynamic> settings, String key, dynamic value) {
    settings.put(key, value);
    return settings.get(key);
  }
}
