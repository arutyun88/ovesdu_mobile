import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entity/reaction_type.dart';
import '../../../domain/entity/user_post/user_post_entity.dart';
import '../../../domain/state/user_post_reaction/user_post_reaction_cubit.dart';
import '../reaction_widget.dart';

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
      child: ReactionWidget(
        liked: liked,
        like: like,
        dislike: dislike,
        likeOnPressed: () =>
            context.read<UserPostReactionCubit>().updatePostReaction(
                  id: widget.post.id,
                  type: liked == null || liked == false
                      ? ReactionType.like
                      : ReactionType.none,
                ),
        dislikeOnPressed: () =>
            context.read<UserPostReactionCubit>().updatePostReaction(
                  id: widget.post.id,
                  type: liked == null || liked == true
                      ? ReactionType.dislike
                      : ReactionType.none,
                ),
      ),
    );
  }
}
