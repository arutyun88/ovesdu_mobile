import 'package:flutter/material.dart';

class AppColors {
  static const Color lightBackground = Color(0xFFFFFFFF);
  static const Color lightText = Color(0xFF1E1E28);

  static const Color darkBackground = Color(0xFF1E1E28);
  static const Color darkText = Color(0xFFFFFFFF);

  static const Color textButton = Color(0xFFFF9726);
  static const Color selectedItemColor = Color(0xFFFF9726);
  static const Color unselectedItemColor = Color(0xFFAAAAAA);
  static const Color hintTextColor = Color.fromRGBO(170, 170, 170, 1);
  static const Color buttonTextColor = Color.fromRGBO(227, 227, 227, 1);

  static const Color orange = Color(0xFFFF9726);
  static const Color green = Color(0xFF407237);
  static const Color blue = Color(0xFF0000A9);
  static const Color red = Color(0xFFBF0C34);
  static const Color purple = Color(0xFF3F3772);

  static const gradientFlagVertical = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [AppColors.red, AppColors.blue, AppColors.orange],
  );

  static const gradientFlagHorizontal = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [AppColors.red, AppColors.blue, AppColors.orange],
  );
}
