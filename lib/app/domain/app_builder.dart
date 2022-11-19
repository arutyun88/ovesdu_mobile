import 'package:flutter/material.dart';

import 'entities/device_entity/device_entity.dart';

abstract class AppBuilder {
  Widget buildApp(
    String locale,
    bool isLightTheme,
    DeviceEntity device,
    bool firstStart,
    bool isCircleAvatar,
  );
}
