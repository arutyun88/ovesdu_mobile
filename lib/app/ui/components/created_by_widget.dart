import 'package:flutter/material.dart';
import 'package:ovesdu_mobile/app/ui/config/app_colors.dart';
import 'package:ovesdu_mobile/app/ui/config/app_style.dart';

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
        style: const TextStyle().withSize(14.0),
      ),
    );
  }
}
