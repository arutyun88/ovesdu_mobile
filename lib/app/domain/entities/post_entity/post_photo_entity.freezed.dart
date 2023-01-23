// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'post_photo_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PostPhotoEntity {
  int get id => throw _privateConstructorUsedError;
  DateTime get created => throw _privateConstructorUsedError;
  String get photo => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PostPhotoEntityCopyWith<PostPhotoEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostPhotoEntityCopyWith<$Res> {
  factory $PostPhotoEntityCopyWith(
          PostPhotoEntity value, $Res Function(PostPhotoEntity) then) =
      _$PostPhotoEntityCopyWithImpl<$Res, PostPhotoEntity>;
  @useResult
  $Res call({int id, DateTime created, String photo});
}

/// @nodoc
class _$PostPhotoEntityCopyWithImpl<$Res, $Val extends PostPhotoEntity>
    implements $PostPhotoEntityCopyWith<$Res> {
  _$PostPhotoEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? created = null,
    Object? photo = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      created: null == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as DateTime,
      photo: null == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PostPhotoEntityCopyWith<$Res>
    implements $PostPhotoEntityCopyWith<$Res> {
  factory _$$_PostPhotoEntityCopyWith(
          _$_PostPhotoEntity value, $Res Function(_$_PostPhotoEntity) then) =
      __$$_PostPhotoEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, DateTime created, String photo});
}

/// @nodoc
class __$$_PostPhotoEntityCopyWithImpl<$Res>
    extends _$PostPhotoEntityCopyWithImpl<$Res, _$_PostPhotoEntity>
    implements _$$_PostPhotoEntityCopyWith<$Res> {
  __$$_PostPhotoEntityCopyWithImpl(
      _$_PostPhotoEntity _value, $Res Function(_$_PostPhotoEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? created = null,
    Object? photo = null,
  }) {
    return _then(_$_PostPhotoEntity(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      created: null == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as DateTime,
      photo: null == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_PostPhotoEntity implements _PostPhotoEntity {
  const _$_PostPhotoEntity(
      {required this.id, required this.created, required this.photo});

  @override
  final int id;
  @override
  final DateTime created;
  @override
  final String photo;

  @override
  String toString() {
    return 'PostPhotoEntity(id: $id, created: $created, photo: $photo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PostPhotoEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.created, created) || other.created == created) &&
            (identical(other.photo, photo) || other.photo == photo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, created, photo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PostPhotoEntityCopyWith<_$_PostPhotoEntity> get copyWith =>
      __$$_PostPhotoEntityCopyWithImpl<_$_PostPhotoEntity>(this, _$identity);
}

abstract class _PostPhotoEntity implements PostPhotoEntity {
  const factory _PostPhotoEntity(
      {required final int id,
      required final DateTime created,
      required final String photo}) = _$_PostPhotoEntity;

  @override
  int get id;
  @override
  DateTime get created;
  @override
  String get photo;
  @override
  @JsonKey(ignore: true)
  _$$_PostPhotoEntityCopyWith<_$_PostPhotoEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
