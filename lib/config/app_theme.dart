import 'package:flutter/material.dart';
import 'package:ovesdu_mobile/config/app_colors.dart';

abstract class AppTheme {
  static final light = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.lightBackground,
    backgroundColor: AppColors.lightBackground,
    hintColor: AppColors.hintTextColor,
    inputDecorationTheme: const InputDecorationTheme(
      hintStyle: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w400),
      labelStyle: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w400),
    ),
  );

  static final dark = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.darkBackground,
    backgroundColor: AppColors.darkBackground,
    hintColor: AppColors.hintTextColor,
    inputDecorationTheme: const InputDecorationTheme(
      hintStyle: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w400),
      labelStyle: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w400),
    ),
  );
}
