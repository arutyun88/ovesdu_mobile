// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'post_video_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PostVideoEntity {
  int get id => throw _privateConstructorUsedError;
  DateTime get created => throw _privateConstructorUsedError;
  String get video => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PostVideoEntityCopyWith<PostVideoEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostVideoEntityCopyWith<$Res> {
  factory $PostVideoEntityCopyWith(
          PostVideoEntity value, $Res Function(PostVideoEntity) then) =
      _$PostVideoEntityCopyWithImpl<$Res, PostVideoEntity>;
  @useResult
  $Res call({int id, DateTime created, String video});
}

/// @nodoc
class _$PostVideoEntityCopyWithImpl<$Res, $Val extends PostVideoEntity>
    implements $PostVideoEntityCopyWith<$Res> {
  _$PostVideoEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? created = null,
    Object? video = null,
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
      video: null == video
          ? _value.video
          : video // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PostVideoEntityCopyWith<$Res>
    implements $PostVideoEntityCopyWith<$Res> {
  factory _$$_PostVideoEntityCopyWith(
          _$_PostVideoEntity value, $Res Function(_$_PostVideoEntity) then) =
      __$$_PostVideoEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, DateTime created, String video});
}

/// @nodoc
class __$$_PostVideoEntityCopyWithImpl<$Res>
    extends _$PostVideoEntityCopyWithImpl<$Res, _$_PostVideoEntity>
    implements _$$_PostVideoEntityCopyWith<$Res> {
  __$$_PostVideoEntityCopyWithImpl(
      _$_PostVideoEntity _value, $Res Function(_$_PostVideoEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? created = null,
    Object? video = null,
  }) {
    return _then(_$_PostVideoEntity(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      created: null == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as DateTime,
      video: null == video
          ? _value.video
          : video // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_PostVideoEntity implements _PostVideoEntity {
  const _$_PostVideoEntity(
      {required this.id, required this.created, required this.video});

  @override
  final int id;
  @override
  final DateTime created;
  @override
  final String video;

  @override
  String toString() {
    return 'PostVideoEntity(id: $id, created: $created, video: $video)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PostVideoEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.created, created) || other.created == created) &&
            (identical(other.video, video) || other.video == video));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, created, video);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PostVideoEntityCopyWith<_$_PostVideoEntity> get copyWith =>
      __$$_PostVideoEntityCopyWithImpl<_$_PostVideoEntity>(this, _$identity);
}

abstract class _PostVideoEntity implements PostVideoEntity {
  const factory _PostVideoEntity(
      {required final int id,
      required final DateTime created,
      required final String video}) = _$_PostVideoEntity;

  @override
  int get id;
  @override
  DateTime get created;
  @override
  String get video;
  @override
  @JsonKey(ignore: true)
  _$$_PostVideoEntityCopyWith<_$_PostVideoEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
