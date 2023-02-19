import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:domain/entity/reaction_type.dart';
import 'package:provider/provider.dart';

import '../../../../../app/data/setting_provider/theme_provider.dart';
import '../../../state/user_post_comment/reaction/user_comment_reaction_cubit.dart';
import '../reaction_widget.dart';

class UserCommentItemReaction extends StatefulWidget {
  const UserCommentItemReaction(
    this.comment, {
    Key? key,
  }) : super(key: key);
  final PostCommentEntity comment;

  @override
  State<UserCommentItemReaction> createState() =>
      _UserCommentItemReactionState();
}

class _UserCommentItemReactionState extends State<UserCommentItemReaction> {
  late ThemeData theme;
  late bool? liked;
  late int like;
  late int dislike;

  @override
  void initState() {
    super.initState();

    liked = widget.comment.liked;
    like = widget.comment.like;
    dislike = widget.comment.dislike;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    theme = Provider.of<ThemeProvider>(context).themeData;
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserCommentReactionCubit, UserCommentReactionState>(
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
        likeOnPressed: likeOnPressed,
        dislikeOnPressed: dislikeOnPressed,
        iconSize: 16,
        authorId: widget.comment.author.id,
      ),
    );
  }

  void likeOnPressed() =>
      context.read<UserCommentReactionCubit>().updateCommentReaction(
            id: widget.comment.id,
            type: liked == null || liked == false
                ? ReactionType.like
                : ReactionType.none,
          );

  void dislikeOnPressed() =>
      context.read<UserCommentReactionCubit>().updateCommentReaction(
            id: widget.comment.id,
            type: liked == null || liked == true
                ? ReactionType.dislike
                : ReactionType.none,
          );
}
