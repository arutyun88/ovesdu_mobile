import 'package:flutter/material.dart';
import 'package:ovesdu_mobile/config/app_colors.dart';

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
      child: const Text(
        '© Created by Arutyun Gevorkyan',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 14.0),
      ),
    );
  }
}
