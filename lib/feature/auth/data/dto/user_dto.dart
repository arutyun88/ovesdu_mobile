import 'package:domain/entity/location_entity/location_entity.dart';
import 'package:domain/entity/user_entity/user_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

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
  final dynamic firstName;
  final dynamic lastName;
  final dynamic dateOfBirth;
  final dynamic locationId;
  final List<DeviceDto>? deviceList;
  final dynamic gender;

  UserDto({
    this.id,
    this.username,
    this.email,
    this.phoneNumber,
    this.phoneCountryCode,
    this.password,
    this.firstName,
    this.lastName,
    this.dateOfBirth,
    this.locationId,
    this.deviceList,
    this.gender,
  });

  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserDtoToJson(this);

  factory UserDto.toDto(UserEntity entity) => UserDto(
        username: entity.username,
        email: entity.email,
        phoneNumber: entity.phoneNumber,
        phoneCountryCode: entity.phoneCountryCode,
        firstName: entity.firstName,
        lastName: entity.lastName,
        dateOfBirth: entity.dateOfBirth,
        locationId: entity.location.uuid,
        password: entity.password,
        deviceList: [DeviceDto.toDto(entity.device!)],
        gender: entity.genderIsMale ? 'male' : 'female',
      );

  UserEntity toEntity(LocationEntity location) => UserEntity(
        username: username,
        email: email,
        phoneNumber: phoneNumber,
        phoneCountryCode: phoneCountryCode,
        firstName: firstName,
        lastName: lastName,
        dateOfBirth: dateOfBirth,
        location: location,
        password: '',
        genderIsMale: gender == 'male',
      );
}
