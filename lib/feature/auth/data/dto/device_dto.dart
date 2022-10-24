import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../app/domain/entities/device_entity/device_entity.dart';

part 'device_dto.g.dart';

@JsonSerializable()
class DeviceDto {
  final dynamic deviceType;
  final dynamic deviceId;

  DeviceDto({
    this.deviceType,
    this.deviceId,
  });

  factory DeviceDto.fromJson(Map<String, dynamic> json) =>
      _$DeviceDtoFromJson(json);

  Map<String, dynamic> toJson() => _$DeviceDtoToJson(this);

  DeviceEntity toEntity() => DeviceEntity(
        deviceType: deviceType.toString(),
        deviceId: deviceId.toString(),
      );

  factory DeviceDto.toDto(DeviceEntity device) => DeviceDto(
        deviceType: device.deviceType,
        deviceId: device.deviceId,
      );
}
