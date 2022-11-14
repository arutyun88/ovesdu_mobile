// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'location_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LocationEntity _$LocationEntityFromJson(Map<String, dynamic> json) {
  return _LocationEntity.fromJson(json);
}

/// @nodoc
mixin _$LocationEntity {
  String get id => throw _privateConstructorUsedError;
  String get country => throw _privateConstructorUsedError;
  String get area => throw _privateConstructorUsedError;
  String get city => throw _privateConstructorUsedError;
  String? get lat => throw _privateConstructorUsedError;
  String? get lon => throw _privateConstructorUsedError;
  String? get uuid => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LocationEntityCopyWith<LocationEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationEntityCopyWith<$Res> {
  factory $LocationEntityCopyWith(
          LocationEntity value, $Res Function(LocationEntity) then) =
      _$LocationEntityCopyWithImpl<$Res, LocationEntity>;
  @useResult
  $Res call(
      {String id,
      String country,
      String area,
      String city,
      String? lat,
      String? lon,
      String? uuid});
}

/// @nodoc
class _$LocationEntityCopyWithImpl<$Res, $Val extends LocationEntity>
    implements $LocationEntityCopyWith<$Res> {
  _$LocationEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? country = null,
    Object? area = null,
    Object? city = null,
    Object? lat = freezed,
    Object? lon = freezed,
    Object? uuid = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      area: null == area
          ? _value.area
          : area // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      lat: freezed == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as String?,
      lon: freezed == lon
          ? _value.lon
          : lon // ignore: cast_nullable_to_non_nullable
              as String?,
      uuid: freezed == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LocationEntityCopyWith<$Res>
    implements $LocationEntityCopyWith<$Res> {
  factory _$$_LocationEntityCopyWith(
          _$_LocationEntity value, $Res Function(_$_LocationEntity) then) =
      __$$_LocationEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String country,
      String area,
      String city,
      String? lat,
      String? lon,
      String? uuid});
}

/// @nodoc
class __$$_LocationEntityCopyWithImpl<$Res>
    extends _$LocationEntityCopyWithImpl<$Res, _$_LocationEntity>
    implements _$$_LocationEntityCopyWith<$Res> {
  __$$_LocationEntityCopyWithImpl(
      _$_LocationEntity _value, $Res Function(_$_LocationEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? country = null,
    Object? area = null,
    Object? city = null,
    Object? lat = freezed,
    Object? lon = freezed,
    Object? uuid = freezed,
  }) {
    return _then(_$_LocationEntity(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      area: null == area
          ? _value.area
          : area // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      lat: freezed == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as String?,
      lon: freezed == lon
          ? _value.lon
          : lon // ignore: cast_nullable_to_non_nullable
              as String?,
      uuid: freezed == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LocationEntity implements _LocationEntity {
  const _$_LocationEntity(
      {required this.id,
      required this.country,
      required this.area,
      required this.city,
      this.lat,
      this.lon,
      this.uuid});

  factory _$_LocationEntity.fromJson(Map<String, dynamic> json) =>
      _$$_LocationEntityFromJson(json);

  @override
  final String id;
  @override
  final String country;
  @override
  final String area;
  @override
  final String city;
  @override
  final String? lat;
  @override
  final String? lon;
  @override
  final String? uuid;

  @override
  String toString() {
    return 'LocationEntity(id: $id, country: $country, area: $area, city: $city, lat: $lat, lon: $lon, uuid: $uuid)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LocationEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.area, area) || other.area == area) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lon, lon) || other.lon == lon) &&
            (identical(other.uuid, uuid) || other.uuid == uuid));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, country, area, city, lat, lon, uuid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LocationEntityCopyWith<_$_LocationEntity> get copyWith =>
      __$$_LocationEntityCopyWithImpl<_$_LocationEntity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LocationEntityToJson(
      this,
    );
  }
}

abstract class _LocationEntity implements LocationEntity {
  const factory _LocationEntity(
      {required final String id,
      required final String country,
      required final String area,
      required final String city,
      final String? lat,
      final String? lon,
      final String? uuid}) = _$_LocationEntity;

  factory _LocationEntity.fromJson(Map<String, dynamic> json) =
      _$_LocationEntity.fromJson;

  @override
  String get id;
  @override
  String get country;
  @override
  String get area;
  @override
  String get city;
  @override
  String? get lat;
  @override
  String? get lon;
  @override
  String? get uuid;
  @override
  @JsonKey(ignore: true)
  _$$_LocationEntityCopyWith<_$_LocationEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
