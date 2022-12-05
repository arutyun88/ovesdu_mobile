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
import '../../../../../app/ui/config/app_colors.dart';
import '../../../../profile/domain/state/profile_cubit.dart';
import '../../../domain/entity/author_entity.dart';
import '../../../domain/state/user_comment_action/user_comment_action_cubit.dart';
import '../../../domain/state/user_post_comment/user_post_comment_cubit.dart';
import '../../../domain/state/user_post_cubit.dart';

class UserCommentHeader extends StatefulWidget {
  const UserCommentHeader({
    Key? key,
    required this.author,
    required this.commentId,
    required this.created,
    required this.updated,
  }) : super(key: key);

  final AuthorEntity author;
  final int commentId;
  final DateTime created;
  final DateTime updated;

  @override
  State<UserCommentHeader> createState() => _UserCommentHeaderState();
}

class _UserCommentHeaderState extends State<UserCommentHeader> {
  late AppLocalizations dictionary;
  late int currentUser;

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
    final isOnline = DateHelper.isOnline(widget.author.lastVisit);
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: itemHorPadding,
        vertical: verticalPadding,
      ),
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
              height: 60,
              width: 60,
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
              child: widget.author.avatar != null
                  ? Image.network(
                      widget.author.avatar!,
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
          Padding(
            padding: const EdgeInsets.only(
              left: 8.0,
              top: 12,
              bottom: 4,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${widget.author.firstName} ${widget.author.lastName}',
                  style: theme.textTheme.headline6,
                ),
                Text(
                  DateHelper.wasPublished(context, widget.created),
                  style: theme.textTheme.bodyText2?.copyWith(
                    color: AppColors.hintTextColor,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: currentUser == widget.author.id
                ? _deleteCommentOnPressed
                : null,
            child: Icon(
              Icons.more_vert,
              size: 24,
              color: currentUser == widget.author.id
                  ? AppColors.orange
                  : AppColors.hintTextColor,
            ),
          ),
        ],
      ),
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
            .deleteComment(widget.commentId)
            .whenComplete(() {
          context.read<UserPostCommentCubit>().commentDeleted(widget.commentId);
          context.read<UserPostCubit>().updateComments(ActionType.remove);
        });
      }
    });
  }
}
