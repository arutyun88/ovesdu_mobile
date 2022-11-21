import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile_follower_entity.freezed.dart';

@freezed
class UserProfileFollowerEntity with _$UserProfileFollowerEntity {
  const factory UserProfileFollowerEntity({
    required String id,
    required String firstName,
    required String lastName,
    required String image,
  }) = _UserProfileFollowerEntity;
}
