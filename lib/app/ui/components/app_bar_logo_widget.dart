import 'package:flutter/material.dart';

import '../config/app_colors.dart';
import '../config/app_fonts.dart';

class AppBarLogoWidget extends StatelessWidget {
  const AppBarLogoWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const fontSize = 30.0;

    return const Text(
      ' OvesDu ',
      style: TextStyle(
        inherit: false,
        fontFamily: AppFonts.roboto,
        fontSize: fontSize,
        fontWeight: FontWeight.w700,
        letterSpacing: -fontSize / 6,
        height: 1.0,
        color: AppColors.hintTextColor,
      ),
    );
  }
}
