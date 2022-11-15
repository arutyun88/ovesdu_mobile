part of 'profile_cubit.dart';

@freezed
class ProfileState with _$ProfileState {
  factory ProfileState.init() = _ProfileStateInit;

  factory ProfileState.waiting() = _ProfileStateWaiting;

  factory ProfileState.received(UserProfileEntity userEntity) =
      _ProfileStateReceived;

  factory ProfileState.error(ErrorEntity error) = _ProfileStateError;
}
