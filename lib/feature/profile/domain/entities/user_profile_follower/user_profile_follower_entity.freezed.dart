// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_profile_follower_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UserProfileFollowerEntity {
  String get id => throw _privateConstructorUsedError;
  String get firstName => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserProfileFollowerEntityCopyWith<UserProfileFollowerEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserProfileFollowerEntityCopyWith<$Res> {
  factory $UserProfileFollowerEntityCopyWith(UserProfileFollowerEntity value,
          $Res Function(UserProfileFollowerEntity) then) =
      _$UserProfileFollowerEntityCopyWithImpl<$Res, UserProfileFollowerEntity>;
  @useResult
  $Res call({String id, String firstName, String lastName, String image});
}

/// @nodoc
class _$UserProfileFollowerEntityCopyWithImpl<$Res,
        $Val extends UserProfileFollowerEntity>
    implements $UserProfileFollowerEntityCopyWith<$Res> {
  _$UserProfileFollowerEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? image = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserProfileFollowerEntityCopyWith<$Res>
    implements $UserProfileFollowerEntityCopyWith<$Res> {
  factory _$$_UserProfileFollowerEntityCopyWith(
          _$_UserProfileFollowerEntity value,
          $Res Function(_$_UserProfileFollowerEntity) then) =
      __$$_UserProfileFollowerEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String firstName, String lastName, String image});
}

/// @nodoc
class __$$_UserProfileFollowerEntityCopyWithImpl<$Res>
    extends _$UserProfileFollowerEntityCopyWithImpl<$Res,
        _$_UserProfileFollowerEntity>
    implements _$$_UserProfileFollowerEntityCopyWith<$Res> {
  __$$_UserProfileFollowerEntityCopyWithImpl(
      _$_UserProfileFollowerEntity _value,
      $Res Function(_$_UserProfileFollowerEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? image = null,
  }) {
    return _then(_$_UserProfileFollowerEntity(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_UserProfileFollowerEntity implements _UserProfileFollowerEntity {
  const _$_UserProfileFollowerEntity(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.image});

  @override
  final String id;
  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String image;

  @override
  String toString() {
    return 'UserProfileFollowerEntity(id: $id, firstName: $firstName, lastName: $lastName, image: $image)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserProfileFollowerEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.image, image) || other.image == image));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, firstName, lastName, image);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserProfileFollowerEntityCopyWith<_$_UserProfileFollowerEntity>
      get copyWith => __$$_UserProfileFollowerEntityCopyWithImpl<
          _$_UserProfileFollowerEntity>(this, _$identity);
}

abstract class _UserProfileFollowerEntity implements UserProfileFollowerEntity {
  const factory _UserProfileFollowerEntity(
      {required final String id,
      required final String firstName,
      required final String lastName,
      required final String image}) = _$_UserProfileFollowerEntity;

  @override
  String get id;
  @override
  String get firstName;
  @override
  String get lastName;
  @override
  String get image;
  @override
  @JsonKey(ignore: true)
  _$$_UserProfileFollowerEntityCopyWith<_$_UserProfileFollowerEntity>
      get copyWith => throw _privateConstructorUsedError;
}
