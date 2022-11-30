part of 'user_post_reaction_cubit.dart';

@freezed
class UserPostReactionState with _$UserPostReactionState {
  factory UserPostReactionState.init() = _UserPostReactionStateInit;

  factory UserPostReactionState.waiting() = _UserPostReactionStateWaiting;

  factory UserPostReactionState.liked() = _UserPostReactionStateLiked;

  factory UserPostReactionState.disliked() = _UserPostReactionStateDisliked;

  factory UserPostReactionState.none() = _UserPostReactionStateNone;

  factory UserPostReactionState.error(ErrorEntity error) =
      _UserPostReactionStateError;
}
