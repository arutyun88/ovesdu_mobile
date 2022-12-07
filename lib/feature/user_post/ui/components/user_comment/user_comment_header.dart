import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../../app/const/const.dart';
import '../../../../../app/data/setting_provider/setting_provider.dart';
import '../../../../../app/data/setting_provider/theme_provider.dart';
import '../../../../../app/di/init_di.dart';
import '../../../../../app/helpers/app_icons.dart';
import '../../../../../app/helpers/date_helper.dart';
import '../../../../../app/ui/components/custom_dialog/custom_dialog.dart';
import '../../../../../app/ui/components/dialog/more_menu_dialog.dart';
import '../../../../../app/ui/config/app_colors.dart';
import '../../../../profile/domain/state/profile_cubit.dart';
import '../../../domain/entity/user_post_comment/user_post_comment_entity.dart';
import '../../../domain/state/user_comment_action/user_comment_action_cubit.dart';
import '../../../domain/state/user_post_comment/user_post_comment_cubit.dart';
import '../../../domain/state/user_post_cubit.dart';

class UserCommentHeader extends StatefulWidget {
  const UserCommentHeader({
    Key? key,
    required this.comment,
    required this.onTapToRead,
    this.replyToComment,
  }) : super(key: key);

  final UserPostCommentEntity comment;
  final Function(
    UserPostCommentEntity editingComment,
    UserPostCommentEntity? replyTo,
  ) onTapToRead;
  final UserPostCommentEntity? replyToComment;

  @override
  State<UserCommentHeader> createState() => _UserCommentHeaderState();
}

class _UserCommentHeaderState extends State<UserCommentHeader> {
  late AppLocalizations dictionary;
  late int currentUser;
  final moreKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    currentUser = locator
            .get<ProfileCubit>()
            .state
            .whenOrNull(received: (user) => user.id) ??
        -1;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    dictionary = AppLocalizations.of(context)!;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeProvider>(context).themeData;
    final avatarIsCircle = Provider.of<SettingProvider>(context).isCircleAvatar;
    final isOnline = DateHelper.isOnline(widget.comment.author.lastVisit);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: itemHorPadding),
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
              height: 48,
              width: 48,
              decoration: BoxDecoration(
                shape: avatarIsCircle ? BoxShape.circle : BoxShape.rectangle,
                borderRadius: avatarIsCircle ? null : BorderRadius.circular(16),
                color: AppColors.hintTextColor.withOpacity(.1),
                border: Border.all(
                  color: isOnline ? AppColors.orange : AppColors.hintTextColor,
                  width: 2,
                  strokeAlign: StrokeAlign.outside,
                ),
              ),
              clipBehavior: Clip.hardEdge,
              child: widget.comment.author.avatar != null
                  ? Image.network(
                      widget.comment.author.avatar!,
                      fit: BoxFit.cover,
                    )
                  : Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: SvgPicture.asset(
                        AppIcons.profileIcon,
                        color: AppColors.hintTextColor,
                      ),
                    ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 8.0,
                top: 8.0,
                bottom: 4,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${widget.comment.author.firstName} ${widget.comment.author.lastName}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.headline6,
                  ),
                  Text(
                    DateHelper.wasPublished(context, widget.comment.created),
                    style: theme.textTheme.bodyText2?.copyWith(
                      color: AppColors.hintTextColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            key: moreKey,
            onTap: _moreOnPressed,
            child: Icon(
              Icons.more_vert,
              size: 24,
              color: currentUser == widget.comment.author.id
                  ? AppColors.orange
                  : AppColors.hintTextColor,
            ),
          ),
        ],
      ),
    );
  }

  void _moreOnPressed() {
    MoreMenuDialog.show(
      context,
      moreKey,
      actions: currentUser == widget.comment.author.id
          ? [
              {
                dictionary.editComment: () {
                  Navigator.of(context).pop();
                  widget.onTapToRead(widget.comment, widget.replyToComment);
                }
              },
              {
                dictionary.deleteComment: () {
                  Navigator.of(context).pop();
                  _deleteCommentOnPressed();
                }
              },
            ]
          : [
              {
                dictionary.complainToComment: () {
                  Navigator.of(context).pop();
                  CustomDialog.showMessageDialog(
                    context,
                    dictionary.inDeveloping,
                  );
                }
              },
            ],
    );
  }

  void _deleteCommentOnPressed() {
    CustomDialog.showConfirmMessageDialog(
      context,
      dictionary.confirmCommentDelete,
    ).then((value) {
      if (value != null && value == true) {
        context
            .read<UserCommentActionCubit>()
            .deleteComment(widget.comment.id)
            .whenComplete(
          () {
            // todo нужно ли каскадное удаление? Выполнять при некоем условии
            // final commentsByState = context
            //     .read<UserPostCommentCubit>()
            //     .state
            //     .whenOrNull(received: (comments) => comments.comments);
            // var comments = commentsByState
            //     ?.where(
            //       (element) => element.toCommentId == widget.comment.id,
            //     )
            //     .toList();
            // if (comments == null || comments.isEmpty) {
            //   context
            //       .read<UserPostCommentCubit>()
            //       .commentDeleted({widget.comment.id});
            //   context.read<UserPostCubit>().updateComments(ActionType.remove);
            // } else {
            //   final ids = comments.map((e) => e.id).toSet();
            //
            //   final result = _cascadeDeleting(context, ids, widget.comment.id);
            //   result.add(widget.comment.id);
            //   context.read<UserPostCommentCubit>().commentDeleted(result);
            //   for (int i = 0; i < result.length; i++) {
            //     context.read<UserPostCubit>().updateComments(ActionType.remove);
            //   }
            // }
            context
                .read<UserPostCommentCubit>()
                .commentDeleted({widget.comment.id});
            context.read<UserPostCubit>().updateComments(ActionType.remove);
          },
        );
      }
    });
  }

// static Set<int> _cascadeDeleting(
//   BuildContext context,
//   Set<int> ids,
//   int searchId,
// ) {
//   final commentsByState = context
//       .read<UserPostCommentCubit>()
//       .state
//       .whenOrNull(received: (comments) => comments.comments);
//   var comments = commentsByState
//       ?.where(
//         (element) => element.toCommentId == searchId,
//       )
//       .toList();
//
//   if (comments != null || comments!.isNotEmpty) {
//     final newIds = comments.map((e) => e.id).toSet();
//     ids.addAll(newIds);
//     for (int id in newIds) {
//       _cascadeDeleting(context, ids, id);
//     }
//   }
//
//   return ids;
// }
}
