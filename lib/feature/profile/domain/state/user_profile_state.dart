part of 'user_profile_cubit.dart';

@freezed
class UserProfileState with _$UserProfileState {
  factory UserProfileState.init() = _UserProfileStateInit;

  factory UserProfileState.waiting() = _UserProfileStateWaiting;

  factory UserProfileState.received(UserProfileEntity userEntity) =
      _UserProfileStateReceived;

  factory UserProfileState.forbidden() = _UserProfileStateForbidden;

  factory UserProfileState.error(ErrorEntity error) = _UserProfileStateError;
}
