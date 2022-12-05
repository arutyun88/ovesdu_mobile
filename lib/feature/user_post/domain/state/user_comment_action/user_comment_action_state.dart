part of 'user_comment_action_cubit.dart';

@freezed
class UserCommentActionState with _$UserCommentActionState {
  factory UserCommentActionState.init() = _UserCommentActionStateInit;

  factory UserCommentActionState.creating() = _UserCommentActionStateCreating;

  factory UserCommentActionState.created(UserPostCommentEntity comment) =
      _UserCommentActionStateCreated;

  factory UserCommentActionState.error(ErrorEntity error) =
      _UserCommentActionStateError;
}
