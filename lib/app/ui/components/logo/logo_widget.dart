import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/setting_provider/theme_provider.dart';
import '../../config/app_colors.dart';
import '../../config/app_fonts.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({
    Key? key,
    required this.fontSize,
  }) : super(key: key);

  final double fontSize;

  @override
  Widget build(BuildContext context) {
    const title = ' OvesDu ';
    const gradient = LinearGradient(
      begin: Alignment(0, -0.4),
      end: Alignment(0, 0.5),
      colors: [AppColors.red, AppColors.blue, AppColors.orange],
    );

    final textStyle = TextStyle(
      inherit: false,
      fontFamily: AppFonts.roboto,
      fontSize: fontSize,
      fontWeight: FontWeight.w700,
      letterSpacing: -fontSize / 6,
      height: 1.0,
    );
    return Container(
      color: Provider.of<ThemeProvider>(context).themeData.backgroundColor,
      child: Stack(
        children: [
          Center(
            child: Text(
              title,
              style: textStyle.copyWith(
                foreground: Paint()
                  ..style = PaintingStyle.stroke
                  ..strokeWidth = fontSize / 24
                  ..color = Colors.grey,
              ),
            ),
          ),
          Center(
            child: ShaderMask(
              blendMode: BlendMode.srcIn,
              shaderCallback: (bounds) => gradient.createShader(
                Rect.fromLTWH(0, 0, bounds.width, bounds.height),
              ),
              child: Text(title, style: textStyle),
            ),
          ),
        ],
      ),
    );
  }
}
