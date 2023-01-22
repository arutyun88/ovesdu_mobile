import 'package:freezed_annotation/freezed_annotation.dart';

part 'device_entity.freezed.dart';

@freezed
class DeviceEntity with _$DeviceEntity {
  const factory DeviceEntity({
    required String deviceType,
    required String deviceId,
  }) = _DeviceEntity;
}
