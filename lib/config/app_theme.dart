import 'package:flutter/material.dart';
import 'package:ovesdu_mobile/config/app_colors.dart';

abstract class AppTheme {
  static final light = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.lightBackground,
    backgroundColor: AppColors.lightBackground,
  );

  static final dark = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.darkBackground,
    backgroundColor: AppColors.darkBackground,
  );
}
