import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../../app/const/const.dart';
import '../../../../app/data/setting_provider/theme_provider.dart';
import '../../../../app/di/init_di.dart';
import '../../../../app/helpers/app_icons.dart';
import '../../../../app/ui/components/buttons/empty_button.dart';
import '../../../../app/ui/config/app_colors.dart';
import '../../../profile/domain/state/profile_cubit.dart';
import 'user_post_helper.dart';

class ReactionWidget extends StatefulWidget {
  const ReactionWidget({
    Key? key,
    required this.liked,
    required this.like,
    required this.dislike,
    required this.likeOnPressed,
    required this.dislikeOnPressed,
    this.iconSize = 20.0,
    required this.authorId,
  }) : super(key: key);

  final bool? liked;
  final int like;
  final int dislike;
  final VoidCallback likeOnPressed;
  final VoidCallback dislikeOnPressed;
  final double iconSize;
  final int authorId;

  @override
  State<ReactionWidget> createState() => _ReactionWidgetState();
}

class _ReactionWidgetState extends State<ReactionWidget> {
  late ThemeData theme;
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
    theme = Provider.of<ThemeProvider>(context).themeData;
  }

  @override
  Widget build(BuildContext context) {
    final dif = widget.like - widget.dislike;
    return Container(
      constraints: currentUser != widget.authorId
          ? BoxConstraints(minWidth: widget.iconSize < 20.0 ? 74.0 : 82.0)
          : null,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (currentUser != widget.authorId)
            EmptyButton(
              onPressed: widget.likeOnPressed,
              child: SizedBox(
                height: widget.iconSize,
                width: widget.iconSize,
                child: SvgPicture.asset(
                  AppIcons.upIcon,
                  color: widget.liked != null && widget.liked!
                      ? AppColors.greenLight
                      : AppColors.hintTextColor,
                ),
              ),
            ),
          if (currentUser != widget.authorId)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: verticalPadding),
              child: Text(
                UserPostHelper.likeCount(widget.like, widget.dislike),
                style: theme.textTheme.bodyText2?.copyWith(
                  color: widget.liked != null
                      ? widget.liked!
                          ? AppColors.greenLight
                          : AppColors.red
                      : AppColors.hintTextColor,
                ),
              ),
            ),
          if (currentUser == widget.authorId)
            if (widget.like != 0 || widget.dislike != 0)
              Text(
                UserPostHelper.likeCount(widget.like, widget.dislike),
                style: theme.textTheme.bodyText2?.copyWith(
                  color: dif == 0
                      ? AppColors.hintTextColor
                      : dif > 0
                          ? AppColors.greenLight
                          : AppColors.red,
                ),
              ),
          if (currentUser != widget.authorId)
            EmptyButton(
              onPressed: widget.dislikeOnPressed,
              child: SizedBox(
                height: widget.iconSize,
                width: widget.iconSize,
                child: SvgPicture.asset(
                  AppIcons.downIcon,
                  color: widget.liked != null && !widget.liked!
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
