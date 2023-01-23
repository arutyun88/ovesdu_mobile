// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_profile_follower_item_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UserProfileFollowerItemEntity {
  String get id => throw _privateConstructorUsedError;
  String get firstName => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserProfileFollowerItemEntityCopyWith<UserProfileFollowerItemEntity>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserProfileFollowerItemEntityCopyWith<$Res> {
  factory $UserProfileFollowerItemEntityCopyWith(
          UserProfileFollowerItemEntity value,
          $Res Function(UserProfileFollowerItemEntity) then) =
      _$UserProfileFollowerItemEntityCopyWithImpl<$Res,
          UserProfileFollowerItemEntity>;
  @useResult
  $Res call({String id, String firstName, String lastName, String? image});
}

/// @nodoc
class _$UserProfileFollowerItemEntityCopyWithImpl<$Res,
        $Val extends UserProfileFollowerItemEntity>
    implements $UserProfileFollowerItemEntityCopyWith<$Res> {
  _$UserProfileFollowerItemEntityCopyWithImpl(this._value, this._then);

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
    Object? image = freezed,
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
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserProfileFollowerItemEntityCopyWith<$Res>
    implements $UserProfileFollowerItemEntityCopyWith<$Res> {
  factory _$$_UserProfileFollowerItemEntityCopyWith(
          _$_UserProfileFollowerItemEntity value,
          $Res Function(_$_UserProfileFollowerItemEntity) then) =
      __$$_UserProfileFollowerItemEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String firstName, String lastName, String? image});
}

/// @nodoc
class __$$_UserProfileFollowerItemEntityCopyWithImpl<$Res>
    extends _$UserProfileFollowerItemEntityCopyWithImpl<$Res,
        _$_UserProfileFollowerItemEntity>
    implements _$$_UserProfileFollowerItemEntityCopyWith<$Res> {
  __$$_UserProfileFollowerItemEntityCopyWithImpl(
      _$_UserProfileFollowerItemEntity _value,
      $Res Function(_$_UserProfileFollowerItemEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? image = freezed,
  }) {
    return _then(_$_UserProfileFollowerItemEntity(
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
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_UserProfileFollowerItemEntity
    implements _UserProfileFollowerItemEntity {
  const _$_UserProfileFollowerItemEntity(
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
  final String? image;

  @override
  String toString() {
    return 'UserProfileFollowerItemEntity(id: $id, firstName: $firstName, lastName: $lastName, image: $image)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserProfileFollowerItemEntity &&
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
  _$$_UserProfileFollowerItemEntityCopyWith<_$_UserProfileFollowerItemEntity>
      get copyWith => __$$_UserProfileFollowerItemEntityCopyWithImpl<
          _$_UserProfileFollowerItemEntity>(this, _$identity);
}

abstract class _UserProfileFollowerItemEntity
    implements UserProfileFollowerItemEntity {
  const factory _UserProfileFollowerItemEntity(
      {required final String id,
      required final String firstName,
      required final String lastName,
      required final String? image}) = _$_UserProfileFollowerItemEntity;

  @override
  String get id;
  @override
  String get firstName;
  @override
  String get lastName;
  @override
  String? get image;
  @override
  @JsonKey(ignore: true)
  _$$_UserProfileFollowerItemEntityCopyWith<_$_UserProfileFollowerItemEntity>
      get copyWith => throw _privateConstructorUsedError;
}
