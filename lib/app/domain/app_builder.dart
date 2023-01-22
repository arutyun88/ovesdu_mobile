import 'package:domain/entity/device_entity/device_entity.dart';
import 'package:flutter/material.dart';

abstract class AppBuilder {
  Widget buildApp(
    String locale,
    bool isLightTheme,
    DeviceEntity device,
    bool firstStart,
    bool isCircleAvatar,
  );
}
