part of 'user_post_comment_cubit.dart';

@freezed
class UserPostCommentState with _$UserPostCommentState {
  factory UserPostCommentState.init() = _UserPostCommentStateInit;

  factory UserPostCommentState.waiting() = _UserPostCommentStateWaiting;

  factory UserPostCommentState.received(List<UserPostCommentEntity> comments) =
      _UserPostCommentStateReceived;

  factory UserPostCommentState.creating() = _UserPostCommentStateCreating;

  factory UserPostCommentState.created(UserPostCommentEntity comment) =
      _UserPostCommentStateCreated;

  factory UserPostCommentState.error(ErrorEntity error) =
      _UserPostCommentStateError;
}
