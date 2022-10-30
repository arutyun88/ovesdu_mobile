import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:ovesdu_mobile/app/ui/config/app_theme.dart';

class ThemeProvider extends ChangeNotifier {
  bool isLightTheme;

  ThemeProvider(this.isLightTheme);

  ThemeData get themeData => isLightTheme ? AppTheme.light : AppTheme.dark;

  void setTheme() async {
    final settings = await Hive.openBox('settings');
    settings.put('lightTheme', !isLightTheme);
    isLightTheme = !isLightTheme;
    settings.close();
    notifyListeners();
  }
}
