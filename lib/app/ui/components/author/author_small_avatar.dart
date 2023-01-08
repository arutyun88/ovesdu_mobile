import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../const/const.dart';
import '../../../data/setting_provider/setting_provider.dart';
import '../../../helpers/app_icons.dart';
import '../../../helpers/date_helper.dart';
import '../../config/app_colors.dart';

class AuthorSmallAvatar extends StatelessWidget {
  const AuthorSmallAvatar({
    Key? key,
    required this.avatar,
    required this.lastVisit,
  }) : super(key: key);

  final String? avatar;
  final DateTime lastVisit;

  @override
  Widget build(BuildContext context) {
    final avatarIsCircle = Provider.of<SettingProvider>(context).isCircleAvatar;
    final isOnline = DateHelper.isOnline(lastVisit);
    return Container(
      height: avatarSmallSize,
      width: avatarSmallSize,
      decoration: BoxDecoration(
        shape: avatarIsCircle ? BoxShape.circle : BoxShape.rectangle,
        borderRadius: avatarIsCircle ? null : BorderRadius.circular(16),
        color: AppColors.hintTextColor.withOpacity(.1),
        border: Border.all(
          color: isOnline ? AppColors.orange : AppColors.hintTextColor,
          width: 2,
          strokeAlign: StrokeAlign.outside,
        ),
      ),
      clipBehavior: Clip.hardEdge,
      child: avatar != null
          ? Image.network(
              avatar!,
              fit: BoxFit.cover,
            )
          : Padding(
              padding: const EdgeInsets.all(4.0),
              child: SvgPicture.asset(
                AppIcons.profileIcon,
                color: AppColors.hintTextColor,
              ),
            ),
    );
  }
}
