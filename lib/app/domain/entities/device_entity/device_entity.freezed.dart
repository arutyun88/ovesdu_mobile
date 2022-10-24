// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'device_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DeviceEntity {
  String get deviceType => throw _privateConstructorUsedError;
  String get deviceId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DeviceEntityCopyWith<DeviceEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeviceEntityCopyWith<$Res> {
  factory $DeviceEntityCopyWith(
          DeviceEntity value, $Res Function(DeviceEntity) then) =
      _$DeviceEntityCopyWithImpl<$Res>;
  $Res call({String deviceType, String deviceId});
}

/// @nodoc
class _$DeviceEntityCopyWithImpl<$Res> implements $DeviceEntityCopyWith<$Res> {
  _$DeviceEntityCopyWithImpl(this._value, this._then);

  final DeviceEntity _value;
  // ignore: unused_field
  final $Res Function(DeviceEntity) _then;

  @override
  $Res call({
    Object? deviceType = freezed,
    Object? deviceId = freezed,
  }) {
    return _then(_value.copyWith(
      deviceType: deviceType == freezed
          ? _value.deviceType
          : deviceType // ignore: cast_nullable_to_non_nullable
              as String,
      deviceId: deviceId == freezed
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_DeviceEntityCopyWith<$Res>
    implements $DeviceEntityCopyWith<$Res> {
  factory _$$_DeviceEntityCopyWith(
          _$_DeviceEntity value, $Res Function(_$_DeviceEntity) then) =
      __$$_DeviceEntityCopyWithImpl<$Res>;
  @override
  $Res call({String deviceType, String deviceId});
}

/// @nodoc
class __$$_DeviceEntityCopyWithImpl<$Res>
    extends _$DeviceEntityCopyWithImpl<$Res>
    implements _$$_DeviceEntityCopyWith<$Res> {
  __$$_DeviceEntityCopyWithImpl(
      _$_DeviceEntity _value, $Res Function(_$_DeviceEntity) _then)
      : super(_value, (v) => _then(v as _$_DeviceEntity));

  @override
  _$_DeviceEntity get _value => super._value as _$_DeviceEntity;

  @override
  $Res call({
    Object? deviceType = freezed,
    Object? deviceId = freezed,
  }) {
    return _then(_$_DeviceEntity(
      deviceType: deviceType == freezed
          ? _value.deviceType
          : deviceType // ignore: cast_nullable_to_non_nullable
              as String,
      deviceId: deviceId == freezed
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_DeviceEntity implements _DeviceEntity {
  const _$_DeviceEntity({required this.deviceType, required this.deviceId});

  @override
  final String deviceType;
  @override
  final String deviceId;

  @override
  String toString() {
    return 'DeviceEntity(deviceType: $deviceType, deviceId: $deviceId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DeviceEntity &&
            const DeepCollectionEquality()
                .equals(other.deviceType, deviceType) &&
            const DeepCollectionEquality().equals(other.deviceId, deviceId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(deviceType),
      const DeepCollectionEquality().hash(deviceId));

  @JsonKey(ignore: true)
  @override
  _$$_DeviceEntityCopyWith<_$_DeviceEntity> get copyWith =>
      __$$_DeviceEntityCopyWithImpl<_$_DeviceEntity>(this, _$identity);
}

abstract class _DeviceEntity implements DeviceEntity {
  const factory _DeviceEntity(
      {required final String deviceType,
      required final String deviceId}) = _$_DeviceEntity;

  @override
  String get deviceType;
  @override
  String get deviceId;
  @override
  @JsonKey(ignore: true)
  _$$_DeviceEntityCopyWith<_$_DeviceEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
