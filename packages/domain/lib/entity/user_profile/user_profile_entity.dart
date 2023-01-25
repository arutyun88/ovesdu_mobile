import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile_entity.freezed.dart';

@freezed
class UserProfileEntity with _$UserProfileEntity {
  const factory UserProfileEntity({
    required int id,
    required String username,
    required String email,
    required String phoneNumber,
    required String firstName,
    required String lastName,
    required DateTime dateOfBirth,
    required DateTime lastVisit,
    required String country,
    required String area,
    required String city,
    required bool isMale,
    required List<int> blockedUsersId,
    String? image,
  }) = _UserProfileEntity;
}
