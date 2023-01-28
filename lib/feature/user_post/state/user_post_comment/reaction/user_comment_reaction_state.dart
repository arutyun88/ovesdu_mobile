part of 'user_comment_reaction_cubit.dart';

@freezed
class UserCommentReactionState with _$UserCommentReactionState {
  factory UserCommentReactionState.init() = _UserCommentReactionStateInit;

  factory UserCommentReactionState.waiting() = _UserCommentReactionStateWaiting;

  factory UserCommentReactionState.liked() = _UserCommentReactionStateLiked;

  factory UserCommentReactionState.disliked() =
      _UserCommentReactionStateDisliked;

  factory UserCommentReactionState.none() = _UserCommentReactionStateNone;

  factory UserCommentReactionState.error(ErrorEntity error) =
      _UserCommentReactionStateError;
}
