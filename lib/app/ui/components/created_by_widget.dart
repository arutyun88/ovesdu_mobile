import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/setting_provider/theme_provider.dart';
import '../config/app_colors.dart';

class CreatedByWidget extends StatelessWidget {
  const CreatedByWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => AppColors.gradientFlagHorizontal.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(
        '© Created by Arutyun Gevorkyan',
        textAlign: TextAlign.center,
        style:
            Provider.of<ThemeProvider>(context).themeData.textTheme.bodyText2,
      ),
    );
  }
}
