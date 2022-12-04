import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../../app/const/const.dart';
import '../../../../app/data/setting_provider/theme_provider.dart';
import '../../../../app/helpers/app_icons.dart';
import '../../../../app/ui/components/buttons/empty_button.dart';
import '../../../../app/ui/config/app_colors.dart';
import 'user_post_helper.dart';

class ReactionWidget extends StatelessWidget {
  const ReactionWidget({
    Key? key,
    required this.liked,
    required this.like,
    required this.dislike,
    required this.likeOnPressed,
    required this.dislikeOnPressed,
  }) : super(key: key);

  final bool? liked;
  final int like;
  final int dislike;
  final VoidCallback likeOnPressed;
  final VoidCallback dislikeOnPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeProvider>(context).themeData;
    return SizedBox(
      width: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          EmptyButton(
            onPressed: likeOnPressed,
            child: SizedBox(
              height: 24,
              width: 24,
              child: SvgPicture.asset(
                AppIcons.likeIcon,
                color: liked != null && liked!
                    ? AppColors.greenLight
                    : AppColors.hintTextColor,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: verticalPadding / 2,
            ),
            child: Text(
              UserPostHelper.likeCount(like, dislike),
              style: theme.textTheme.bodyText2?.copyWith(
                color: liked != null
                    ? liked!
                        ? AppColors.greenLight
                        : AppColors.red
                    : AppColors.hintTextColor,
              ),
            ),
          ),
          EmptyButton(
            onPressed: dislikeOnPressed,
            child: SizedBox(
              height: 24,
              width: 24,
              child: SvgPicture.asset(
                AppIcons.dislikeIcon,
                color: liked != null && !liked!
                    ? AppColors.red
                    : AppColors.hintTextColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
