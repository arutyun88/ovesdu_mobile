import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../../helpers/setting_key.dart';
import '../../ui/config/app_theme.dart';

class ThemeProvider extends ChangeNotifier {
  bool isLightTheme;

  ThemeProvider(this.isLightTheme);

  ThemeData get themeData => isLightTheme ? AppTheme.light : AppTheme.dark;

  void setTheme() async {
    final settings = await Hive.openBox(SettingKey.settings);
    settings.put(SettingKey.theme, !isLightTheme);
    isLightTheme = !isLightTheme;
    notifyListeners();
  }
}
