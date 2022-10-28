import 'package:freezed_annotation/freezed_annotation.dart';

import 'device_dto.dart';

part 'user_dto.g.dart';

@JsonSerializable()
class UserDto {
  final dynamic id;
  final dynamic username;
  final dynamic email;
  final dynamic phoneNumber;
  final dynamic password;
  final dynamic name;
  final List<DeviceDto>? deviceList;

  UserDto({
    this.id,
    this.username,
    this.email,
    this.phoneNumber,
    this.password,
    this.name,
    this.deviceList,
  });

  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserDtoToJson(this);
}
