import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile_statistic_entity.freezed.dart';

@freezed
class UserProfileStatisticEntity with _$UserProfileStatisticEntity {
  const factory UserProfileStatisticEntity({
    required String trust,
    required String coins,
    required List<int> followers,
    required List<int> following,
  }) = _UserProfileStatisticEntity;
}
