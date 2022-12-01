import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../../../app/const/const.dart';
import '../../../../../app/data/setting_provider/theme_provider.dart';
import '../../../../../app/helpers/app_icons.dart';
import '../../../../../app/ui/components/buttons/empty_button.dart';
import '../../../../../app/ui/config/app_colors.dart';
import '../../../domain/entity/reaction_type.dart';
import '../../../domain/entity/user_post/user_post_entity.dart';
import '../../../domain/state/user_post_reaction/user_post_reaction_cubit.dart';

class UserPostItemReaction extends StatefulWidget {
  const UserPostItemReaction({
    Key? key,
    required this.post,
  }) : super(key: key);

  final UserPostEntity post;

  @override
  State<UserPostItemReaction> createState() => _UserPostItemReactionState();
}

class _UserPostItemReactionState extends State<UserPostItemReaction> {
  late ThemeData theme;
  late bool? liked;
  late int like;
  late int dislike;

  @override
  void initState() {
    super.initState();

    liked = widget.post.liked;
    like = widget.post.like;
    dislike = widget.post.dislike;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    theme = Provider.of<ThemeProvider>(context).themeData;
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserPostReactionCubit, UserPostReactionState>(
      listener: (context, state) {
        state.whenOrNull(
          liked: () => setState(() {
            if (liked == false) {
              dislike = dislike - 1;
            }
            like = like + 1;
            liked = true;
          }),
          disliked: () => setState(() {
            if (liked == true) {
              like = like - 1;
            }
            dislike = dislike + 1;
            liked = false;
          }),
          none: () => setState(() {
            if (liked == true) {
              like = like - 1;
            } else {
              dislike = dislike - 1;
            }
            liked = null;
          }),
        );
      },
      child: SizedBox(
        width: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            EmptyButton(
              onPressed: () =>
                  context.read<UserPostReactionCubit>().updatePostReaction(
                        id: widget.post.id,
                        type: liked == null || liked == false
                            ? ReactionType.like
                            : ReactionType.none,
                      ),
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
                _likeCount(like, dislike),
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
              onPressed: () =>
                  context.read<UserPostReactionCubit>().updatePostReaction(
                        id: widget.post.id,
                        type: liked == null || liked == true
                            ? ReactionType.dislike
                            : ReactionType.none,
                      ),
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
