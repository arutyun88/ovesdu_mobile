import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../app/const/const.dart';
import '../../../../../app/data/setting_provider/theme_provider.dart';
import '../../../../../app/di/init_di.dart';
import '../../../../../app/helpers/helpers.dart';
import '../../../../../app/ui/config/app_colors.dart';
import '../../../domain/entity/user_post_comment/user_post_comment_entity.dart';
import '../../../domain/state/user_post_comment/reaction/user_comment_reaction_cubit.dart';
import '../../../domain/user_post_repository.dart';
import 'user_comment_item_reaction.dart';

class UserCommentItemStatistic extends StatelessWidget {
  const UserCommentItemStatistic(
    this.comment, {
    Key? key,
  }) : super(key: key);

  final UserPostCommentEntity comment;

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeProvider>(context).themeData;

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: verticalPadding,
        horizontal: itemHorPadding,
      ),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 24,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (comment.answers != 0)
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: verticalPadding,
                ),
                child: Text(
                  Helpers.answersTitle(context, comment.answers),
                  style: theme.textTheme.bodyText2?.copyWith(
                    color: AppColors.hintTextColor,
                  ),
                ),
              ),
            const Spacer(),
            Provider(
              create: (_) => UserCommentReactionCubit(
                locator.get<UserPostRepository>(),
              ),
              builder: (context, child) => UserCommentItemReaction(comment),
              child: UserCommentItemReaction(comment),
            ),
          ],
        ),
      ),
    );
  }
}
