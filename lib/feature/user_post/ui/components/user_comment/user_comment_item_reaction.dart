import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../app/data/setting_provider/theme_provider.dart';
import '../../../domain/entity/user_post_comment/user_post_comment_entity.dart';
import '../reaction_widget.dart';

class UserCommentItemReaction extends StatefulWidget {
  const UserCommentItemReaction(
    this.comment, {
    Key? key,
  }) : super(key: key);
  final UserPostCommentEntity comment;

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
    return ReactionWidget(
      liked: liked,
      like: like,
      dislike: dislike,
      likeOnPressed: () {},
      dislikeOnPressed: () {},
    );
  }
}
