import 'package:flutter/cupertino.dart';
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
    this.iconSize = 20.0,
  }) : super(key: key);

  final bool? liked;
  final int like;
  final int dislike;
  final VoidCallback likeOnPressed;
  final VoidCallback dislikeOnPressed;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeProvider>(context).themeData;

    return ConstrainedBox(
      constraints: BoxConstraints(minWidth: iconSize < 20.0 ? 74.0 : 82.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          EmptyButton(
            onPressed: likeOnPressed,
            child: SizedBox(
              height: iconSize,
              width: iconSize,
              child: SvgPicture.asset(
                AppIcons.upIcon,
                color: liked != null && liked!
                    ? AppColors.greenLight
                    : AppColors.hintTextColor,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: verticalPadding),
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
              height: iconSize,
              width: iconSize,
              child: SvgPicture.asset(
                AppIcons.downIcon,
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
