import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../app/const/const.dart';
import '../../../../../app/data/setting_provider/theme_provider.dart';
import '../../../../../app/ui/config/app_colors.dart';
import '../../../domain/entity/user_post_comment/user_post_comment_entity.dart';
import 'user_comment_header.dart';
import 'user_comment_item_statistic.dart';
import 'user_comment_replied_item.dart';

class UserCommentItem extends StatelessWidget {
  const UserCommentItem(
    this.comment, {
    Key? key,
    this.replyToComment,
    this.replyToCommentText,
    this.replyToCommentAuthor,
    required this.onTapToRead,
  }) : super(key: key);

  final UserPostCommentEntity comment;
  final UserPostCommentEntity? replyToComment;
  final String? replyToCommentText;
  final String? replyToCommentAuthor;
  final Function(
    UserPostCommentEntity editingComment,
    UserPostCommentEntity? replyTo,
  ) onTapToRead;

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeProvider>(context).themeData;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: verticalPadding),
          child: Column(
            children: [
              UserCommentHeader(
                comment: comment,
                onTapToRead: onTapToRead,
                replyToComment: replyToComment,
              ),
              if (replyToCommentText != null)
                UserCommentRepliedItem(
                  replyToCommentAuthor: replyToCommentAuthor,
                  replyToCommentText: replyToCommentText,
                ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.only(
                  left: itemHorPadding,
                  right: itemHorPadding,
                  bottom: verticalPadding,
                ),
                child: Text(
                  comment.text ?? '',
                  style: theme.textTheme.bodyText1,
                ),
              ),
              UserCommentItemStatistic(comment),
            ],
          ),
        ),
        Container(
          height: verticalPadding / 2,
          color: AppColors.hintTextColor.withOpacity(.1),
        ),
      ],
    );
  }
}
