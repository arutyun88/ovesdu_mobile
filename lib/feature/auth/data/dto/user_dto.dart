import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../app/domain/entities/user_entity/user_entity.dart';
import 'device_dto.dart';

part 'user_dto.g.dart';

@JsonSerializable()
class UserDto {
  final dynamic id;
  final dynamic username;
  final dynamic email;
  final dynamic phoneNumber;
  final dynamic phoneCountryCode;
  final dynamic password;
  final dynamic name;
  final dynamic dateOfBirth;
  final dynamic country;
  final dynamic city;
  final List<DeviceDto>? deviceList;

  UserDto({
    this.id,
    this.username,
    this.email,
    this.phoneNumber,
    this.phoneCountryCode,
    this.password,
    this.name,
    this.dateOfBirth,
    this.country,
    this.city,
    this.deviceList,
  });

  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserDtoToJson(this);

  factory UserDto.toDto(UserEntity entity) => UserDto(
        username: entity.username,
        email: entity.email,
        phoneNumber: entity.phoneNumber,
        phoneCountryCode: entity.phoneCountryCode,
        name: entity.name,
        dateOfBirth: entity.dateOfBirth,
        country: entity.country,
        city: entity.city,
        password: entity.password,
        deviceList: [DeviceDto.toDto(entity.device)],
      );
}
