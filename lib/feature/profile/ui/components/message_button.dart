import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../app/helpers/app_icons.dart';
import '../../../../app/ui/config/app_colors.dart';

class MessageButton extends StatelessWidget {
  const MessageButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      width: 64,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.orange,
      ),
      child: Center(
        child: Container(
          height: 62,
          width: 62,
          padding: const EdgeInsets.all(14.0),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                blurStyle: BlurStyle.outer,
                spreadRadius: 1.0,
                color: Colors.black.withOpacity(.1),
              ),
            ],
            shape: BoxShape.circle,
            color: AppColors.orange,
          ),
          child: SvgPicture.asset(AppIcons.messageIcon),
        ),
      ),
    );
  }
}
