import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../app/const/const.dart';
import '../../../../../app/ui/config/app_colors.dart';
import '../../../domain/entity/user_post/user_post_entity.dart';
import '../../../domain/state/user_post_cubit.dart';
import '../user_post_item/user_post_item_content.dart';
import '../user_post_item_statistic/user_post_item_statistic.dart';

class UserCommentPost extends StatefulWidget {
  const UserCommentPost({
    Key? key,
    required this.avatar,
    required this.lastVisit,
    required this.post,
  }) : super(key: key);

  final String? avatar;
  final DateTime lastVisit;
  final UserPostEntity post;

  @override
  State<UserCommentPost> createState() => _UserCommentPostState();
}

class _UserCommentPostState extends State<UserCommentPost> {
  late UserPostEntity postEntity;

  @override
  void initState() {
    super.initState();

    postEntity = widget.post;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocListener<UserPostCubit, UserPostState>(
          listener: (context, state) {
            state.whenOrNull(
              updated: (entity) => setState(() => postEntity = entity),
            );
          },
          child: Hero(
            transitionOnUserGestures: true,
            tag: '${widget.post.id}:'
                '${widget.post.author.lastName}.'
                '${widget.post.author.firstName}',
            child: Column(
              children: [
                UserPostItemContent(post: postEntity, isCommentScreen: true),
                UserPostItemStatistic(
                  avatar: widget.avatar,
                  post: postEntity,
                  lastVisit: widget.lastVisit,
                  isCommentScreen: true,
                ),
              ],
            ),
          ),
        ),
        Container(
          height: verticalPadding,
          color: AppColors.hintTextColor.withOpacity(.1),
        ),
      ],
    );
  }
}