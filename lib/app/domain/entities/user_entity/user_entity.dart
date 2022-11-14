import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../app/domain/entities/device_entity/device_entity.dart';
import '../../../../feature/location/domain/entities/location_entity/location_entity.dart';

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
    required LocationEntity location,
    String? password,
    DeviceEntity? device,
    required bool genderIsMale,
  }) = _UserEntity;
}
