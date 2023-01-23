import 'package:domain/entity/device_entity/device_entity.dart';
import 'package:domain/entity/location_entity/location_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_entity.freezed.dart';

@freezed
class UserEntity with _$UserEntity {
  const factory UserEntity({
    required String username,
    required String email,
    required String phoneNumber,
    required String phoneCountryCode,
    required String firstName,
    required String lastName,
    required String dateOfBirth,
    required LocationEntity location,
    String? password,
    DeviceEntity? device,
    required bool genderIsMale,
  }) = _UserEntity;
}
