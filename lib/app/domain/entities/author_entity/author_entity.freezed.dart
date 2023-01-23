// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'author_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthorEntity {
  int get id => throw _privateConstructorUsedError;
  String? get avatar => throw _privateConstructorUsedError;
  String get firstName => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;
  DateTime get lastVisit => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AuthorEntityCopyWith<AuthorEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthorEntityCopyWith<$Res> {
  factory $AuthorEntityCopyWith(
          AuthorEntity value, $Res Function(AuthorEntity) then) =
      _$AuthorEntityCopyWithImpl<$Res, AuthorEntity>;
  @useResult
  $Res call(
      {int id,
      String? avatar,
      String firstName,
      String lastName,
      DateTime lastVisit});
}

/// @nodoc
class _$AuthorEntityCopyWithImpl<$Res, $Val extends AuthorEntity>
    implements $AuthorEntityCopyWith<$Res> {
  _$AuthorEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? avatar = freezed,
    Object? firstName = null,
    Object? lastName = null,
    Object? lastVisit = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      lastVisit: null == lastVisit
          ? _value.lastVisit
          : lastVisit // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AuthorEntityCopyWith<$Res>
    implements $AuthorEntityCopyWith<$Res> {
  factory _$$_AuthorEntityCopyWith(
          _$_AuthorEntity value, $Res Function(_$_AuthorEntity) then) =
      __$$_AuthorEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String? avatar,
      String firstName,
      String lastName,
      DateTime lastVisit});
}

/// @nodoc
class __$$_AuthorEntityCopyWithImpl<$Res>
    extends _$AuthorEntityCopyWithImpl<$Res, _$_AuthorEntity>
    implements _$$_AuthorEntityCopyWith<$Res> {
  __$$_AuthorEntityCopyWithImpl(
      _$_AuthorEntity _value, $Res Function(_$_AuthorEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? avatar = freezed,
    Object? firstName = null,
    Object? lastName = null,
    Object? lastVisit = null,
  }) {
    return _then(_$_AuthorEntity(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      lastVisit: null == lastVisit
          ? _value.lastVisit
          : lastVisit // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$_AuthorEntity implements _AuthorEntity {
  const _$_AuthorEntity(
      {required this.id,
      required this.avatar,
      required this.firstName,
      required this.lastName,
      required this.lastVisit});

  @override
  final int id;
  @override
  final String? avatar;
  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final DateTime lastVisit;

  @override
  String toString() {
    return 'AuthorEntity(id: $id, avatar: $avatar, firstName: $firstName, lastName: $lastName, lastVisit: $lastVisit)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuthorEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.lastVisit, lastVisit) ||
                other.lastVisit == lastVisit));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, avatar, firstName, lastName, lastVisit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AuthorEntityCopyWith<_$_AuthorEntity> get copyWith =>
      __$$_AuthorEntityCopyWithImpl<_$_AuthorEntity>(this, _$identity);
}

abstract class _AuthorEntity implements AuthorEntity {
  const factory _AuthorEntity(
      {required final int id,
      required final String? avatar,
      required final String firstName,
      required final String lastName,
      required final DateTime lastVisit}) = _$_AuthorEntity;

  @override
  int get id;
  @override
  String? get avatar;
  @override
  String get firstName;
  @override
  String get lastName;
  @override
  DateTime get lastVisit;
  @override
  @JsonKey(ignore: true)
  _$$_AuthorEntityCopyWith<_$_AuthorEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
