import 'package:flutter/material.dart';
import 'package:ovesdu_mobile/app/ui/config/app_colors.dart';

abstract class AppTheme {
  static final light = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.lightBackground,
    backgroundColor: AppColors.lightBackground,
    textTheme: TextTheme(
      headline5: ThemeData.dark().textTheme.headline5?.copyWith(
            color: AppColors.lightText,
          ),
      headline4: const TextStyle(
        color: AppColors.lightText,
        fontSize: 20,
      ),
      subtitle2: const TextStyle(
        color: AppColors.lightText,
        fontSize: 24,
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      hintStyle: TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w400,
        color: AppColors.hintTextColor,
      ),
      labelStyle: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w400),
    ),
  );

  static final dark = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.darkBackground,
    backgroundColor: AppColors.darkBackground,
    textTheme: TextTheme(
      headline5: ThemeData.dark().textTheme.headline5?.copyWith(
            color: AppColors.darkText,
          ),
      headline4: const TextStyle(
        color: AppColors.darkText,
        fontSize: 20,
      ),
      subtitle2: const TextStyle(
        color: AppColors.darkText,
        fontSize: 24,
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      hintStyle: TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w400,
        color: AppColors.hintTextColor,
      ),
      labelStyle: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w400),
    ),
  );
}

extension TextStyleExt on TextTheme {
  get hintStyle2 => const TextStyle(color: AppColors.red);
}
