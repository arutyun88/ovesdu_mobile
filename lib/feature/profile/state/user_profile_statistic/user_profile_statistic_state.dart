part of 'user_profile_statistic_cubit.dart';

@freezed
class UserProfileStatisticState with _$UserProfileStatisticState {
  factory UserProfileStatisticState.init() = _UUserProfileStatisticStateInit;

  factory UserProfileStatisticState.waiting() =
      _UserProfileStatisticStateWaiting;

  factory UserProfileStatisticState.received(
          UserProfileStatisticEntity userEntity) =
      _UserProfileStatisticStateReceived;

  factory UserProfileStatisticState.error(ErrorEntity error) =
      _UserProfileStatisticStateError;
}
