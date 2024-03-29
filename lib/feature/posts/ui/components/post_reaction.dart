import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:domain/entity/reaction_type.dart';

import '../../../user_post/state/user_post_cubit.dart';
import '../../../user_post/state/user_post_reaction/user_post_reaction_cubit.dart';
import '../../../user_post/ui/components/reaction_widget.dart';

class PostReaction extends StatefulWidget {
  const PostReaction({
    Key? key,
    required this.post,
  }) : super(key: key);

  final PostEntity post;

  @override
  State<PostReaction> createState() => _PostReactionState();
}

class _PostReactionState extends State<PostReaction> {
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
        likeOnPressed: _likeOnPressed,
        dislikeOnPressed: _dislikeOnPressed,
        authorId: widget.post.author.id,
      ),
    );
  }

  void _likeOnPressed() => context
          .read<UserPostReactionCubit>()
          .updatePostReaction(
            id: widget.post.id,
            type: liked == null || liked == false
                ? ReactionType.like
                : ReactionType.none,
          )
          .then(
        (value) {
          context.read<UserPostCubit>().updateLikes(
                liked == null || liked == false
                    ? ReactionType.like
                    : ReactionType.none,
              );
        },
      );

  void _dislikeOnPressed() => context
          .read<UserPostReactionCubit>()
          .updatePostReaction(
            id: widget.post.id,
            type: liked == null || liked == true
                ? ReactionType.dislike
                : ReactionType.none,
          )
          .then(
        (value) {
          context.read<UserPostCubit>().updateLikes(
                liked == null || liked == true
                    ? ReactionType.dislike
                    : ReactionType.none,
              );
        },
      );
}
