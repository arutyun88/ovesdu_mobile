// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_post_comments_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UserPostCommentsEntity {
  int get last => throw _privateConstructorUsedError;
  int get limit => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;
  List<UserPostCommentEntity> get comments =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserPostCommentsEntityCopyWith<UserPostCommentsEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserPostCommentsEntityCopyWith<$Res> {
  factory $UserPostCommentsEntityCopyWith(UserPostCommentsEntity value,
          $Res Function(UserPostCommentsEntity) then) =
      _$UserPostCommentsEntityCopyWithImpl<$Res, UserPostCommentsEntity>;
  @useResult
  $Res call(
      {int last, int limit, int count, List<UserPostCommentEntity> comments});
}

/// @nodoc
class _$UserPostCommentsEntityCopyWithImpl<$Res,
        $Val extends UserPostCommentsEntity>
    implements $UserPostCommentsEntityCopyWith<$Res> {
  _$UserPostCommentsEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? last = null,
    Object? limit = null,
    Object? count = null,
    Object? comments = null,
  }) {
    return _then(_value.copyWith(
      last: null == last
          ? _value.last
          : last // ignore: cast_nullable_to_non_nullable
              as int,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      comments: null == comments
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<UserPostCommentEntity>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserPostCommentsEntityCopyWith<$Res>
    implements $UserPostCommentsEntityCopyWith<$Res> {
  factory _$$_UserPostCommentsEntityCopyWith(_$_UserPostCommentsEntity value,
          $Res Function(_$_UserPostCommentsEntity) then) =
      __$$_UserPostCommentsEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int last, int limit, int count, List<UserPostCommentEntity> comments});
}

/// @nodoc
class __$$_UserPostCommentsEntityCopyWithImpl<$Res>
    extends _$UserPostCommentsEntityCopyWithImpl<$Res,
        _$_UserPostCommentsEntity>
    implements _$$_UserPostCommentsEntityCopyWith<$Res> {
  __$$_UserPostCommentsEntityCopyWithImpl(_$_UserPostCommentsEntity _value,
      $Res Function(_$_UserPostCommentsEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? last = null,
    Object? limit = null,
    Object? count = null,
    Object? comments = null,
  }) {
    return _then(_$_UserPostCommentsEntity(
      last: null == last
          ? _value.last
          : last // ignore: cast_nullable_to_non_nullable
              as int,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      comments: null == comments
          ? _value._comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<UserPostCommentEntity>,
    ));
  }
}

/// @nodoc

class _$_UserPostCommentsEntity implements _UserPostCommentsEntity {
  const _$_UserPostCommentsEntity(
      {required this.last,
      required this.limit,
      required this.count,
      required final List<UserPostCommentEntity> comments})
      : _comments = comments;

  @override
  final int last;
  @override
  final int limit;
  @override
  final int count;
  final List<UserPostCommentEntity> _comments;
  @override
  List<UserPostCommentEntity> get comments {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_comments);
  }

  @override
  String toString() {
    return 'UserPostCommentsEntity(last: $last, limit: $limit, count: $count, comments: $comments)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserPostCommentsEntity &&
            (identical(other.last, last) || other.last == last) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.count, count) || other.count == count) &&
            const DeepCollectionEquality().equals(other._comments, _comments));
  }

  @override
  int get hashCode => Object.hash(runtimeType, last, limit, count,
      const DeepCollectionEquality().hash(_comments));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserPostCommentsEntityCopyWith<_$_UserPostCommentsEntity> get copyWith =>
      __$$_UserPostCommentsEntityCopyWithImpl<_$_UserPostCommentsEntity>(
          this, _$identity);
}

abstract class _UserPostCommentsEntity implements UserPostCommentsEntity {
  const factory _UserPostCommentsEntity(
          {required final int last,
          required final int limit,
          required final int count,
          required final List<UserPostCommentEntity> comments}) =
      _$_UserPostCommentsEntity;

  @override
  int get last;
  @override
  int get limit;
  @override
  int get count;
  @override
  List<UserPostCommentEntity> get comments;
  @override
  @JsonKey(ignore: true)
  _$$_UserPostCommentsEntityCopyWith<_$_UserPostCommentsEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
