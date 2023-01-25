import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../app/const/const.dart';
import '../../../../../app/data/setting_provider/theme_provider.dart';
import '../../../../../app/ui/config/app_colors.dart';
import '../user_post_item/user_post_item_header.dart';

class UserCommentPostHeader extends StatelessWidget {
  const UserCommentPostHeader({
    Key? key,
    required this.postEntity,
    required this.avatar,
    required this.lastVisit,
    required this.onTapToUp,
  }) : super(key: key);

  final PostEntity postEntity;

  final String? avatar;
  final DateTime lastVisit;
  final VoidCallback onTapToUp;

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeProvider>(context).themeData;
    return Material(
      elevation: 1,
      child: Container(
        color: theme.backgroundColor,
        padding: const EdgeInsets.only(left: 24.0),
        child: Row(
          children: [
            GestureDetector(
              onTap: () => Navigator.of(context).pop(postEntity),
              child: const Icon(
                Icons.arrow_back_ios,
                size: iconSize,
                color: AppColors.orange,
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width - 60,
              child: GestureDetector(
                onTap: onTapToUp,
                child: UserPostItemHeader(
                  avatar: avatar,
                  postEntity: postEntity,
                  lastVisit: lastVisit,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
