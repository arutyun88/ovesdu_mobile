import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../../app/const/const.dart';
import '../../../../../app/data/setting_provider/theme_provider.dart';
import '../../../../../app/di/init_di.dart';
import '../../../../../app/ui/components/custom_dialog/custom_dialog.dart';
import '../../../../../app/ui/components/custom_page_route.dart';
import '../../../../../app/ui/config/app_colors.dart';
import '../../../../profile/state/profile_cubit.dart';
import '../../../../profile/ui/user_profile_screen.dart';
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

  final PostCommentEntity comment;
  final PostCommentEntity? replyToComment;
  final String? replyToCommentText;
  final String? replyToCommentAuthor;
  final Function(
    PostCommentEntity editingComment,
    PostCommentEntity? replyTo,
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
              GestureDetector(
                onTap: () => _goUserPage(context, comment.author),
                child: UserCommentHeader(
                  comment: comment,
                  onTapToRead: onTapToRead,
                  replyToComment: replyToComment,
                ),
              ),
              if (replyToCommentText != null)
                UserCommentRepliedItem(
                  replyToCommentAuthor: replyToCommentAuthor,
                  replyToCommentText: replyToCommentText,
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

  void _goUserPage(BuildContext context, AuthorEntity author) {
    final dictionary = AppLocalizations.of(context)!;
    final currentUser = locator
        .get<ProfileCubit>()
        .state
        .whenOrNull(received: (user) => user.id);
    if (author.id != currentUser) {
      Navigator.of(context).push(
        CustomPageRoute(
          child: UserProfileScreen(
            userId: author.id.toString(),
            firsName: author.firstName,
            lastName: author.lastName,
            image: author.avatar,
          ),
        ),
      );
    } else {
      CustomDialog.showMessageDialog(context, dictionary.inDeveloping);
    }
  }
}
