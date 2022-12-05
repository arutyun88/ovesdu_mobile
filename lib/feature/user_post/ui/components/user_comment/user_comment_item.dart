import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../../app/const/const.dart';
import '../../../../../app/data/setting_provider/theme_provider.dart';
import '../../../../../app/ui/config/app_colors.dart';
import '../../../../../app/ui/components/item_divider.dart';
import '../../../domain/entity/user_post_comment/user_post_comment_entity.dart';
import 'user_comment_header.dart';
import 'user_comment_item_statistic.dart';

class UserCommentItem extends StatelessWidget {
  const UserCommentItem(
    this.comment, {
    Key? key,
    this.replyToComment,
  }) : super(key: key);

  final UserPostCommentEntity comment;
  final UserPostCommentEntity? replyToComment;

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeProvider>(context).themeData;
    final dictionary = AppLocalizations.of(context)!;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: verticalPadding),
          child: Column(
            children: [
              UserCommentHeader(
                avatar: comment.author.avatar,
                firstName: comment.author.firstName,
                lastName: comment.author.lastName,
                created: comment.created,
                updated: comment.updated,
                lastVisit: comment.author.lastVisit,
              ),
              if (replyToComment != null)
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: verticalPadding,
                    horizontal: verticalPadding * 2,
                  ),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: verticalPadding,
                      horizontal: verticalPadding * 2,
                    ),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: AppColors.hintTextColor.withOpacity(.07),
                      borderRadius: BorderRadius.circular(mainRadius / 3),
                      border: Border.all(
                        width: 1,
                        color: AppColors.hintTextColor.withOpacity(.3),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          dictionary
                              .responseToComment(comment.author.firstName),
                          style: theme.textTheme.bodyText2?.copyWith(
                            color: AppColors.hintTextColor,
                          ),
                        ),
                        const Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: verticalPadding),
                          child: ItemDivider(
                            padding: EdgeInsets.zero,
                            color: AppColors.hintTextColor,
                          ),
                        ),
                        Text(
                          replyToComment?.text ?? '',
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.bodyText2,
                        ),
                      ],
                    ),
                  ),
                ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(
                  horizontal: itemHorPadding,
                  vertical: verticalPadding,
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
