import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../../helpers/setting_key.dart';

class SettingProvider extends ChangeNotifier {
  bool isCircleAvatar;

  SettingProvider(this.isCircleAvatar);

  void setCircleAvatar() async {
    final settings = await Hive.openBox(SettingKey.settings);
    await settings.put(SettingKey.avatar, !isCircleAvatar);
    isCircleAvatar = !isCircleAvatar;
    notifyListeners();
  }
}
