import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../app/data/setting_provider/setting_provider.dart';
import '../../../../../app/data/setting_provider/theme_provider.dart';
import '../../../../../app/helpers/date_helper.dart';
import '../../../../../app/ui/config/app_colors.dart';

class ProfilePostHeader extends StatelessWidget {
  const ProfilePostHeader({
    Key? key,
    required this.avatar,
    required this.firstName,
    required this.lastName,
    required this.created,
    required this.updated,
    required this.lastVisit,
  }) : super(key: key);

  final String? avatar;
  final String firstName;
  final String lastName;
  final DateTime created;
  final DateTime updated;
  final DateTime lastVisit;

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeProvider>(context).themeData;
    final avatarIsCircle = Provider.of<SettingProvider>(context).isCircleAvatar;
    final isOnline = DateHelper.isOnline(lastVisit);
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 8.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              Provider.of<SettingProvider>(context, listen: false)
                  .setCircleAvatar();
            },
            child: Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                shape: avatarIsCircle ? BoxShape.circle : BoxShape.rectangle,
                borderRadius: avatarIsCircle ? null : BorderRadius.circular(16),
                color: AppColors.hintTextColor,
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
                  : Image.network(
                      'https://caknowledge.com/wp-content/uploads/2022/05/Chuck-'
                      'Norris-Net-Worth-100-million.jpg',
                      fit: BoxFit.cover,
                    ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 8.0,
              top: 12,
              bottom: 4,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$firstName $lastName',
                  style: theme.textTheme.headline6,
                ),
                Text(
                  DateHelper.wasPublished(context, created),
                  style: theme.textTheme.bodyText2?.copyWith(
                    color: AppColors.hintTextColor,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          const Icon(
            Icons.more_horiz,
            size: 24,
            color: AppColors.hintTextColor,
          ),
        ],
      ),
    );
  }
}