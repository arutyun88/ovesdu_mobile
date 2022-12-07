import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../app/const/const.dart';
import '../../../../../app/data/setting_provider/theme_provider.dart';
import '../../../../../app/ui/config/app_colors.dart';
import '../../../domain/entity/user_post/user_post_entity.dart';
import '../user_post_item/user_post_item_header.dart';

class UserCommentPostHeader extends StatelessWidget {
  const UserCommentPostHeader({
    Key? key,
    required this.postEntity,
    required this.avatar,
    required this.lastVisit,
  }) : super(key: key);

  final UserPostEntity postEntity;

  final String? avatar;
  final DateTime lastVisit;

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
              child: UserPostItemHeader(
                avatar: avatar,
                postEntity: postEntity,
                lastVisit: lastVisit,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
