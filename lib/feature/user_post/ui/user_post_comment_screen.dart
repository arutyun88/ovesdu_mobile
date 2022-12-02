import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../app/data/setting_provider/theme_provider.dart';
import '../../../app/ui/config/app_colors.dart';
import '../domain/entity/user_post/user_post_entity.dart';
import 'components/user_post_item/user_post_item_content.dart';
import 'components/user_post_item/user_post_item_header.dart';

class UserPostCommentScreen extends StatelessWidget {
  const UserPostCommentScreen({
    Key? key,
    required this.avatar,
    required this.post,
    required this.lastVisit,
  }) : super(key: key);
  final String? avatar;
  final DateTime lastVisit;
  final UserPostEntity post;

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeProvider>(context).themeData;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 24.0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: const Icon(
                      Icons.arrow_back_ios,
                      size: 24,
                      color: AppColors.orange,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 60,
                    child: UserPostItemHeader(
                      avatar: avatar,
                      firstName: post.author.firstName,
                      lastName: post.author.lastName,
                      created: post.created,
                      updated: post.updated,
                      lastVisit: lastVisit,
                    ),
                  ),
                ],
              ),
            ),
            Hero(
              tag:
                  '${post.id}:${post.author.lastName}.${post.author.firstName}',
              child: UserPostItemContent(post: post),
            ),
          ],
        ),
      ),
    );
  }
}
