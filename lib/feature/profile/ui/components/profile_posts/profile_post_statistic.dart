import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ovesdu_mobile/app/const/const.dart';
import 'package:provider/provider.dart';

import '../../../../../app/data/setting_provider/theme_provider.dart';
import '../../../../../app/helpers/app_icons.dart';
import '../../../../../app/ui/config/app_colors.dart';
import '../../../../user_post/domain/entity/user_post/user_post_entity.dart';

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
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 24,
                  width: 24,
                  child: SvgPicture.asset(
                    AppIcons.likeIcon,
                    color: widget.post.liked != null && widget.post.liked!
                        ? AppColors.greenLight
                        : AppColors.hintTextColor,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: verticalPadding),
                  child: Text(
                    _likeCount(widget.post.like, widget.post.dislike),
                    style: theme.textTheme.bodyText2?.copyWith(
                      color: widget.post.liked != null
                          ? widget.post.liked!
                              ? AppColors.greenLight
                              : AppColors.red
                          : AppColors.hintTextColor,
                    ),
                  ),
                ),
                SizedBox(
                  height: 24,
                  width: 24,
                  child: SvgPicture.asset(
                    AppIcons.dislikeIcon,
                    color: widget.post.liked != null && !widget.post.liked!
                        ? AppColors.red
                        : AppColors.hintTextColor,
                  ),
                ),
              ],
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

  String _likeCount(int like, int dislike) {
    final dif = like - dislike;
    if (dif == 0) {
      return '$dif';
    }

    final String sign;
    if (dif < 0) {
      sign = '-';
    } else {
      sign = '+';
    }

    final String value;
    if (dif.abs() >= 1000) {
      value = '$sign ${dif.abs() / 1000} K';
    } else {
      value = '$sign ${dif.abs()}';
    }
    return value;
  }
}
