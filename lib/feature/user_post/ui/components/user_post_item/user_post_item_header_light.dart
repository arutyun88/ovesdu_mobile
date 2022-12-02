import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../app/const/const.dart';
import '../../../../../app/data/setting_provider/theme_provider.dart';
import '../../../../../app/helpers/date_helper.dart';
import '../../../../../app/ui/config/app_colors.dart';

class UserPostItemHeaderLight extends StatelessWidget {
  const UserPostItemHeaderLight({
    Key? key,
    required this.created,
  }) : super(key: key);

  final DateTime created;

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeProvider>(context).themeData;
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(mainRadius),
        ),
        color: theme.backgroundColor,
      ),
      child: Container(
        color: AppColors.hintTextColor.withOpacity(.1),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 16.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(width: iconSize),
                  const Spacer(),
                  Text(
                    DateHelper.wasPublished(context, created),
                    style: theme.textTheme.bodyText1?.copyWith(
                      color: AppColors.hintTextColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.more_vert,
                    size: iconSize,
                    color: AppColors.hintTextColor,
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(mainRadius),
                ),
                color: theme.backgroundColor,
              ),
              height: mainRadius,
              width: MediaQuery.of(context).size.width,
            )
          ],
        ),
      ),
    );
  }
}
