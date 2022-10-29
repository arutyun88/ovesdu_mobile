import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../app/domain/entities/device_entity/device_entity.dart';

part 'user_entity.freezed.dart';

@freezed
class UserEntity with _$UserEntity {
  const factory UserEntity({
    required String username,
    required String email,
    required String phoneNumber,
    required String phoneCountryCode,
    required String name,
    required String dateOfBirth,
    required String country,
    required String city,
    required String password,
    required DeviceEntity device,
  }) = _UserEntity;
}
