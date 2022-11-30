import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../../../app/const/const.dart';
import '../../../../../app/data/setting_provider/theme_provider.dart';
import '../../../../../app/di/init_di.dart';
import '../../../../../app/helpers/app_icons.dart';
import '../../../../../app/ui/config/app_colors.dart';
import '../../../../user_post/domain/entity/user_post/user_post_entity.dart';
import '../../../../user_post/domain/state/user_post_reaction/user_post_reaction_cubit.dart';
import '../../../../user_post/domain/user_post_repository.dart';
import 'profile_post_reaction.dart';

class ProfilePostStatistic extends StatefulWidget {
  const ProfilePostStatistic({
    Key? key,
    required this.post,
  }) : super(key: key);
  final UserPostEntity post;

  @override
  State<ProfilePostStatistic> createState() => _ProfilePostStatisticState();
}

class _ProfilePostStatisticState extends State<ProfilePostStatistic> {
  late ThemeData theme;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    theme = Provider.of<ThemeProvider>(context).themeData;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: verticalPadding,
        horizontal: mainPadding / 2,
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
              builder: (context, child) => ProfilePostReaction(
                post: widget.post,
              ),
            ),
            Row(
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
                    padding:
                        const EdgeInsets.symmetric(horizontal: verticalPadding),
                    child: Text(
                      '${widget.post.comment}',
                      style: theme.textTheme.bodyText2?.copyWith(
                        color: AppColors.hintTextColor,
                      ),
                    ),
                  ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 24,
                  width: 24,
                  child: SvgPicture.asset(
                    AppIcons.eyeIcon,
                    color: AppColors.hintTextColor,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: verticalPadding),
                  child: Text(
                    '129',
                    style: theme.textTheme.bodyText2?.copyWith(
                      color: AppColors.hintTextColor,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
