part of 'my_followers_cubit.dart';

@freezed
class MyFollowersState with _$MyFollowersState {
  factory MyFollowersState.init() = _MyFollowersStateInit;

  factory MyFollowersState.waiting() = _MyFollowersStateWaiting;

  factory MyFollowersState.received(UserSimpleFollowersEntity followers) =
      _MyFollowersStateReceived;

  factory MyFollowersState.created(int id) = _MyFollowersStateCreated;

  factory MyFollowersState.deleted(int id) = _MyFollowersStateDeleted;

  factory MyFollowersState.error(ErrorEntity error) = _MyFollowersStateError;
}
