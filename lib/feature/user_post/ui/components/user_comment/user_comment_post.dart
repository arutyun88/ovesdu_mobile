import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../app/const/const.dart';
import '../../../../../app/ui/config/app_colors.dart';
import '../../../../posts/ui/components/post_statistic.dart';
import '../../../state/user_post_cubit.dart';
import '../../../../posts/ui/components/post_content.dart';

class UserCommentPost extends StatefulWidget {
  const UserCommentPost({
    Key? key,
    required this.avatar,
    required this.lastVisit,
    required this.post,
  }) : super(key: key);

  final String? avatar;
  final DateTime lastVisit;
  final PostEntity post;

  @override
  State<UserCommentPost> createState() => _UserCommentPostState();
}

class _UserCommentPostState extends State<UserCommentPost> {
  late PostEntity postEntity;

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
                PostContent(post: postEntity, isCommentScreen: true),
                PostStatistic(
                  avatar: widget.avatar,
                  post: postEntity,
                  lastVisit: widget.lastVisit,
                  isCommentScreen: true,
                  whenChanged: (PostEntity entity) {
                    context.read<UserPostCubit>().postUpdated(entity);
                  },
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
