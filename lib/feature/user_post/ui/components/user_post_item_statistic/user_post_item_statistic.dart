import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../../../app/const/const.dart';
import '../../../../../app/data/setting_provider/theme_provider.dart';
import '../../../../../app/di/init_di.dart';
import '../../../../../app/helpers/app_icons.dart';
import '../../../../../app/ui/components/buttons/empty_button.dart';
import '../../../../../app/ui/config/app_colors.dart';
import '../../../../../app/ui/components/custom_page_route.dart';
import '../../../domain/entity/user_post/user_post_entity.dart';
import '../../../domain/state/user_post_cubit.dart';
import '../../../domain/state/user_post_reaction/user_post_reaction_cubit.dart';
import '../../../domain/user_post_repository.dart';
import '../../user_post_comment_screen.dart';
import 'user_post_item_reaction.dart';

class UserPostItemStatistic extends StatefulWidget {
  const UserPostItemStatistic({
    Key? key,
    required this.avatar,
    required this.lastVisit,
    required this.post,
    this.isCommentScreen = false,
  }) : super(key: key);
  final String? avatar;
  final DateTime lastVisit;
  final UserPostEntity post;
  final bool isCommentScreen;

  @override
  State<UserPostItemStatistic> createState() => _UserPostItemStatisticState();
}

class _UserPostItemStatisticState extends State<UserPostItemStatistic> {
  late ThemeData theme;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    theme = Provider.of<ThemeProvider>(context).themeData;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: theme.backgroundColor,
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
            Provider(
              create: (_) => UserPostReactionCubit(
                locator.get<UserPostRepository>(),
              ),
              builder: (context, child) => UserPostItemReaction(
                post: widget.post,
              ),
            ),
            EmptyButton(
              onPressed: widget.isCommentScreen
                  ? () => Navigator.of(context).pop()
                  : () => _onPressedToCommentPage(),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 24,
                    width: 36,
                    child: SvgPicture.asset(
                      widget.post.comment > 0
                          ? AppIcons.commentsIcon
                          : AppIcons.notCommentsIcon,
                      color: AppColors.hintTextColor,
                    ),
                  ),
                  if (widget.post.comment > 0)
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: verticalPadding),
                      child: Text(
                        '${widget.post.comment}',
                        style: theme.textTheme.bodyText2?.copyWith(
                          color: AppColors.hintTextColor,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onPressedToCommentPage() => Navigator.of(context)
          .push(
        CustomPageRoute(
          slideDirection: AxisDirection.right,
          child: UserPostCommentScreen(
            post: widget.post,
            lastVisit: widget.lastVisit,
            avatar: widget.avatar,
          ),
        ),
      )
          .then(
        (value) {
          if (value != null) {
            context.read<UserPostCubit>().postUpdated(value as UserPostEntity);
          }
        },
      );
}
