import 'package:flutter/material.dart';

import '../../../../app/ui/config/app_colors.dart';
import '../../../../app/ui/config/app_fonts.dart';

class AppBarPageWidget extends StatelessWidget {
  const AppBarPageWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0),
      child: Text(
        title,
        style: const TextStyle(
          fontFamily: AppFonts.mainFont,
          fontSize: 30.0,
          fontWeight: FontWeight.w400,
          color: AppColors.hintTextColor,
        ),
      ),
    );
  }
}
