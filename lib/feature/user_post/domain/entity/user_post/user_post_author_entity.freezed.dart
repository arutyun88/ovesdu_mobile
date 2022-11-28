// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_post_author_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UserPostAuthorEntity {
  int get id => throw _privateConstructorUsedError;
  String get firstName => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserPostAuthorEntityCopyWith<UserPostAuthorEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserPostAuthorEntityCopyWith<$Res> {
  factory $UserPostAuthorEntityCopyWith(UserPostAuthorEntity value,
          $Res Function(UserPostAuthorEntity) then) =
      _$UserPostAuthorEntityCopyWithImpl<$Res, UserPostAuthorEntity>;
  @useResult
  $Res call({int id, String firstName, String lastName});
}

/// @nodoc
class _$UserPostAuthorEntityCopyWithImpl<$Res,
        $Val extends UserPostAuthorEntity>
    implements $UserPostAuthorEntityCopyWith<$Res> {
  _$UserPostAuthorEntityCopyWithImpl(this._value, this._then);

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
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserPostAuthorEntityCopyWith<$Res>
    implements $UserPostAuthorEntityCopyWith<$Res> {
  factory _$$_UserPostAuthorEntityCopyWith(_$_UserPostAuthorEntity value,
          $Res Function(_$_UserPostAuthorEntity) then) =
      __$$_UserPostAuthorEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String firstName, String lastName});
}

/// @nodoc
class __$$_UserPostAuthorEntityCopyWithImpl<$Res>
    extends _$UserPostAuthorEntityCopyWithImpl<$Res, _$_UserPostAuthorEntity>
    implements _$$_UserPostAuthorEntityCopyWith<$Res> {
  __$$_UserPostAuthorEntityCopyWithImpl(_$_UserPostAuthorEntity _value,
      $Res Function(_$_UserPostAuthorEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? firstName = null,
    Object? lastName = null,
  }) {
    return _then(_$_UserPostAuthorEntity(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_UserPostAuthorEntity implements _UserPostAuthorEntity {
  const _$_UserPostAuthorEntity(
      {required this.id, required this.firstName, required this.lastName});

  @override
  final int id;
  @override
  final String firstName;
  @override
  final String lastName;

  @override
  String toString() {
    return 'UserPostAuthorEntity(id: $id, firstName: $firstName, lastName: $lastName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserPostAuthorEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, firstName, lastName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserPostAuthorEntityCopyWith<_$_UserPostAuthorEntity> get copyWith =>
      __$$_UserPostAuthorEntityCopyWithImpl<_$_UserPostAuthorEntity>(
          this, _$identity);
}

abstract class _UserPostAuthorEntity implements UserPostAuthorEntity {
  const factory _UserPostAuthorEntity(
      {required final int id,
      required final String firstName,
      required final String lastName}) = _$_UserPostAuthorEntity;

  @override
  int get id;
  @override
  String get firstName;
  @override
  String get lastName;
  @override
  @JsonKey(ignore: true)
  _$$_UserPostAuthorEntityCopyWith<_$_UserPostAuthorEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
