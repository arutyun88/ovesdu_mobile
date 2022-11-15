// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UserEntity {
  String get username => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;
  String get phoneCountryCode => throw _privateConstructorUsedError;
  String get firstName => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;
  String get dateOfBirth => throw _privateConstructorUsedError;
  LocationEntity get location => throw _privateConstructorUsedError;
  String? get password => throw _privateConstructorUsedError;
  DeviceEntity? get device => throw _privateConstructorUsedError;
  bool get genderIsMale => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserEntityCopyWith<UserEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserEntityCopyWith<$Res> {
  factory $UserEntityCopyWith(
          UserEntity value, $Res Function(UserEntity) then) =
      _$UserEntityCopyWithImpl<$Res, UserEntity>;
  @useResult
  $Res call(
      {String username,
      String email,
      String phoneNumber,
      String phoneCountryCode,
      String firstName,
      String lastName,
      String dateOfBirth,
      LocationEntity location,
      String? password,
      DeviceEntity? device,
      bool genderIsMale});

  $LocationEntityCopyWith<$Res> get location;
  $DeviceEntityCopyWith<$Res>? get device;
}

/// @nodoc
class _$UserEntityCopyWithImpl<$Res, $Val extends UserEntity>
    implements $UserEntityCopyWith<$Res> {
  _$UserEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? email = null,
    Object? phoneNumber = null,
    Object? phoneCountryCode = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? dateOfBirth = null,
    Object? location = null,
    Object? password = freezed,
    Object? device = freezed,
    Object? genderIsMale = null,
  }) {
    return _then(_value.copyWith(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      phoneCountryCode: null == phoneCountryCode
          ? _value.phoneCountryCode
          : phoneCountryCode // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      dateOfBirth: null == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as LocationEntity,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      device: freezed == device
          ? _value.device
          : device // ignore: cast_nullable_to_non_nullable
              as DeviceEntity?,
      genderIsMale: null == genderIsMale
          ? _value.genderIsMale
          : genderIsMale // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LocationEntityCopyWith<$Res> get location {
    return $LocationEntityCopyWith<$Res>(_value.location, (value) {
      return _then(_value.copyWith(location: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $DeviceEntityCopyWith<$Res>? get device {
    if (_value.device == null) {
      return null;
    }

    return $DeviceEntityCopyWith<$Res>(_value.device!, (value) {
      return _then(_value.copyWith(device: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_UserEntityCopyWith<$Res>
    implements $UserEntityCopyWith<$Res> {
  factory _$$_UserEntityCopyWith(
          _$_UserEntity value, $Res Function(_$_UserEntity) then) =
      __$$_UserEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String username,
      String email,
      String phoneNumber,
      String phoneCountryCode,
      String firstName,
      String lastName,
      String dateOfBirth,
      LocationEntity location,
      String? password,
      DeviceEntity? device,
      bool genderIsMale});

  @override
  $LocationEntityCopyWith<$Res> get location;
  @override
  $DeviceEntityCopyWith<$Res>? get device;
}

/// @nodoc
class __$$_UserEntityCopyWithImpl<$Res>
    extends _$UserEntityCopyWithImpl<$Res, _$_UserEntity>
    implements _$$_UserEntityCopyWith<$Res> {
  __$$_UserEntityCopyWithImpl(
      _$_UserEntity _value, $Res Function(_$_UserEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? email = null,
    Object? phoneNumber = null,
    Object? phoneCountryCode = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? dateOfBirth = null,
    Object? location = null,
    Object? password = freezed,
    Object? device = freezed,
    Object? genderIsMale = null,
  }) {
    return _then(_$_UserEntity(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      phoneCountryCode: null == phoneCountryCode
          ? _value.phoneCountryCode
          : phoneCountryCode // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      dateOfBirth: null == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as LocationEntity,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      device: freezed == device
          ? _value.device
          : device // ignore: cast_nullable_to_non_nullable
              as DeviceEntity?,
      genderIsMale: null == genderIsMale
          ? _value.genderIsMale
          : genderIsMale // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_UserEntity implements _UserEntity {
  const _$_UserEntity(
      {required this.username,
      required this.email,
      required this.phoneNumber,
      required this.phoneCountryCode,
      required this.firstName,
      required this.lastName,
      required this.dateOfBirth,
      required this.location,
      this.password,
      this.device,
      required this.genderIsMale});

  @override
  final String username;
  @override
  final String email;
  @override
  final String phoneNumber;
  @override
  final String phoneCountryCode;
  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String dateOfBirth;
  @override
  final LocationEntity location;
  @override
  final String? password;
  @override
  final DeviceEntity? device;
  @override
  final bool genderIsMale;

  @override
  String toString() {
    return 'UserEntity(username: $username, email: $email, phoneNumber: $phoneNumber, phoneCountryCode: $phoneCountryCode, firstName: $firstName, lastName: $lastName, dateOfBirth: $dateOfBirth, location: $location, password: $password, device: $device, genderIsMale: $genderIsMale)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserEntity &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.phoneCountryCode, phoneCountryCode) ||
                other.phoneCountryCode == phoneCountryCode) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.dateOfBirth, dateOfBirth) ||
                other.dateOfBirth == dateOfBirth) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.device, device) || other.device == device) &&
            (identical(other.genderIsMale, genderIsMale) ||
                other.genderIsMale == genderIsMale));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      username,
      email,
      phoneNumber,
      phoneCountryCode,
      firstName,
      lastName,
      dateOfBirth,
      location,
      password,
      device,
      genderIsMale);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserEntityCopyWith<_$_UserEntity> get copyWith =>
      __$$_UserEntityCopyWithImpl<_$_UserEntity>(this, _$identity);
}

abstract class _UserEntity implements UserEntity {
  const factory _UserEntity(
      {required final String username,
      required final String email,
      required final String phoneNumber,
      required final String phoneCountryCode,
      required final String firstName,
      required final String lastName,
      required final String dateOfBirth,
      required final LocationEntity location,
      final String? password,
      final DeviceEntity? device,
      required final bool genderIsMale}) = _$_UserEntity;

  @override
  String get username;
  @override
  String get email;
  @override
  String get phoneNumber;
  @override
  String get phoneCountryCode;
  @override
  String get firstName;
  @override
  String get lastName;
  @override
  String get dateOfBirth;
  @override
  LocationEntity get location;
  @override
  String? get password;
  @override
  DeviceEntity? get device;
  @override
  bool get genderIsMale;
  @override
  @JsonKey(ignore: true)
  _$$_UserEntityCopyWith<_$_UserEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
