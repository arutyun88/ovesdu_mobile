import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile_follower_item_entity.freezed.dart';

@freezed
class UserProfileFollowerItemEntity with _$UserProfileFollowerItemEntity {
  const factory UserProfileFollowerItemEntity({
    required String id,
    required String firstName,
    required String lastName,
    required String image,
  }) = _UserProfileFollowerItemEntity;
}
