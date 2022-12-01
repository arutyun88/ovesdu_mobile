import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../app/data/setting_provider/theme_provider.dart';
import '../../../../../app/ui/config/app_colors.dart';
import '../user_post_item_statictic/user_post_item_statistic.dart';
import '../../../domain/entity/user_post/user_post_entity.dart';
import 'user_post_item_content.dart';
import 'user_post_item_header.dart';

class UserPostItem extends StatelessWidget {
  const UserPostItem({
    Key? key,
    required this.avatar,
    required this.lastVisit,
    required this.post,
  }) : super(key: key);

  final String? avatar;
  final DateTime lastVisit;
  final UserPostEntity post;

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeProvider>(context).themeData;

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: theme.backgroundColor,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 2),
            color: AppColors.hintTextColor.withOpacity(.2),
            blurRadius: 4.0,
            blurStyle: BlurStyle.outer,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          UserPostItemHeader(
            avatar: avatar,
            firstName: post.author.firstName,
            lastName: post.author.lastName,
            created: post.created,
            updated: post.updated,
            lastVisit: lastVisit,
          ),
          UserPostItemContent(post: post),
          UserPostItemStatistic(post: post),
        ],
      ),
    );
  }
}
