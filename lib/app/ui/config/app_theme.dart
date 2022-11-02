import 'package:flutter/material.dart';
import 'package:ovesdu_mobile/app/ui/config/app_colors.dart';
import 'package:ovesdu_mobile/app/ui/config/app_fonts.dart';

abstract class AppTheme {
  static final light = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.lightBackground,
    backgroundColor: AppColors.lightBackground,
    textTheme: const TextTheme(
      subtitle2: TextStyle(
        color: AppColors.lightText,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        fontFamily: AppFonts.mainFont,
      ),
      subtitle1: TextStyle(
        color: AppColors.lightText,
        fontSize: 16,
        fontWeight: FontWeight.w400,
        fontFamily: AppFonts.mainFont,
      ),
      bodyText2: TextStyle(
        color: AppColors.lightText,
        fontSize: 14,
        fontWeight: FontWeight.w400,
        fontFamily: AppFonts.mainFont,
      ),
      bodyText1: TextStyle(
        color: AppColors.lightText,
        fontSize: 16,
        fontWeight: FontWeight.w400,
        fontFamily: AppFonts.mainFont,
      ),
      headline6: TextStyle(
        color: AppColors.lightText,
        fontSize: 20,
        fontWeight: FontWeight.w500,
        fontFamily: AppFonts.mainFont,
      ),
      headline5: TextStyle(
        color: AppColors.lightText,
        fontSize: 24,
        fontWeight: FontWeight.w400,
        fontFamily: AppFonts.mainFont,
      ),
      headline4: TextStyle(
        color: AppColors.lightText,
        fontSize: 34,
        fontWeight: FontWeight.w400,
        fontFamily: AppFonts.mainFont,
      ),
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: AppColors.hintTextColor,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      hintStyle: TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w400,
        color: AppColors.hintTextColor,
        fontFamily: AppFonts.mainFont,
      ),
      labelStyle: TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w400,
        color: AppColors.hintTextColor,
        fontFamily: AppFonts.mainFont,
      ),
      floatingLabelStyle: TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w400,
        color: AppColors.hintTextColor,
        fontFamily: AppFonts.mainFont,
      ),
    ),
  );

  static final dark = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.darkBackground,
    backgroundColor: AppColors.darkBackground,
    textTheme: const TextTheme(
      subtitle2: TextStyle(
        color: AppColors.darkText,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        fontFamily: AppFonts.mainFont,
      ),
      subtitle1: TextStyle(
        color: AppColors.darkText,
        fontSize: 16,
        fontWeight: FontWeight.w400,
        fontFamily: AppFonts.mainFont,
      ),
      bodyText2: TextStyle(
        color: AppColors.darkText,
        fontSize: 14,
        fontWeight: FontWeight.w400,
        fontFamily: AppFonts.mainFont,
      ),
      bodyText1: TextStyle(
        color: AppColors.darkText,
        fontSize: 16,
        fontWeight: FontWeight.w400,
        fontFamily: AppFonts.mainFont,
      ),
      headline6: TextStyle(
        color: AppColors.darkText,
        fontSize: 20,
        fontWeight: FontWeight.w500,
        fontFamily: AppFonts.mainFont,
      ),
      headline5: TextStyle(
        color: AppColors.darkText,
        fontSize: 24,
        fontWeight: FontWeight.w400,
        fontFamily: AppFonts.mainFont,
      ),
      headline4: TextStyle(
        color: AppColors.darkText,
        fontSize: 34,
        fontWeight: FontWeight.w400,
        fontFamily: AppFonts.mainFont,
      ),
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: AppColors.hintTextColor,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      hintStyle: TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w400,
        color: AppColors.hintTextColor,
        fontFamily: AppFonts.mainFont,
      ),
      labelStyle: TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w400,
        color: AppColors.hintTextColor,
        fontFamily: AppFonts.mainFont,
      ),
      floatingLabelStyle: TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w400,
        color: AppColors.hintTextColor,
        fontFamily: AppFonts.mainFont,
      ),
    ),
  );
}

extension TextStyleExt on TextTheme {
  get hintStyle2 => const TextStyle(color: AppColors.red);
}
