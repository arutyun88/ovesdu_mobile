part of 'user_profile_follower_cubit.dart';

@freezed
class UserProfileFollowersState with _$UserProfileFollowersState {
  factory UserProfileFollowersState.init() = _UserProfileFollowersStateInit;

  factory UserProfileFollowersState.waiting() =
      _UserProfileFollowersStateWaiting;

  factory UserProfileFollowersState.received(
          List<UserProfileFollowerEntity> followers) =
      _UserProfileFollowersStateReceived;

  factory UserProfileFollowersState.error(ErrorEntity error) =
      _UserProfileFollowersStateError;
}
