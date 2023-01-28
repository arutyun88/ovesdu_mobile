part of 'user_post_comment_cubit.dart';

@freezed
class UserPostCommentState with _$UserPostCommentState {
  factory UserPostCommentState.init() = _UserPostCommentStateInit;

  factory UserPostCommentState.waiting() = _UserPostCommentStateWaiting;

  factory UserPostCommentState.received(PostCommentsEntity comments) =
      _UserPostCommentStateReceived;

  factory UserPostCommentState.creating() = _UserPostCommentStateCreating;

  factory UserPostCommentState.created(PostCommentEntity comment) =
      _UserPostCommentStateCreated;

  factory UserPostCommentState.error(ErrorEntity error) =
      _UserPostCommentStateError;
}
