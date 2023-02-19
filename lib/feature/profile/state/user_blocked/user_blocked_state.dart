part of 'user_blocked_cubit.dart';

@freezed
class UserBlockedState with _$UserBlockedState {
  factory UserBlockedState.init() = _UserBlockedStateInit;

  factory UserBlockedState.waiting() = _UserBlockedStateWaiting;

  factory UserBlockedState.received(List<int> blocked) =
      _UserBlockedStateReceived;

  factory UserBlockedState.added(int id) = _UserBlockedStateAdded;

  factory UserBlockedState.removed(int id) = _UserBlockedStateRemoved;

  factory UserBlockedState.error(ErrorEntity error) = _UserBlockedStateError;
}
