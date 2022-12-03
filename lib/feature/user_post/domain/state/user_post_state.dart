part of 'user_post_cubit.dart';

@freezed
class UserPostState with _$UserPostState {
  factory UserPostState.init() = _UserPostStateInit;

  factory UserPostState.waiting() = _UserPostStateWaiting;

  factory UserPostState.received(UserPostsEntity postsEntity) =
      _UserPostStateReceived;

  factory UserPostState.updated(UserPostEntity postEntity) =
      _UserPostStateUpdated;

  factory UserPostState.error(ErrorEntity error) = _UserPostStateError;
}
