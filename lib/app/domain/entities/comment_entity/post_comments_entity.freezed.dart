// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'post_comments_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PostCommentsEntity {
  int get last => throw _privateConstructorUsedError;
  int get limit => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;
  List<PostCommentEntity> get comments => throw _privateConstructorUsedError;
  List<PostCommentEntity> get commentsResponses =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PostCommentsEntityCopyWith<PostCommentsEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostCommentsEntityCopyWith<$Res> {
  factory $PostCommentsEntityCopyWith(
          PostCommentsEntity value, $Res Function(PostCommentsEntity) then) =
      _$PostCommentsEntityCopyWithImpl<$Res, PostCommentsEntity>;
  @useResult
  $Res call(
      {int last,
      int limit,
      int count,
      List<PostCommentEntity> comments,
      List<PostCommentEntity> commentsResponses});
}

/// @nodoc
class _$PostCommentsEntityCopyWithImpl<$Res, $Val extends PostCommentsEntity>
    implements $PostCommentsEntityCopyWith<$Res> {
  _$PostCommentsEntityCopyWithImpl(this._value, this._then);

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
    Object? commentsResponses = null,
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
              as List<PostCommentEntity>,
      commentsResponses: null == commentsResponses
          ? _value.commentsResponses
          : commentsResponses // ignore: cast_nullable_to_non_nullable
              as List<PostCommentEntity>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PostCommentsEntityCopyWith<$Res>
    implements $PostCommentsEntityCopyWith<$Res> {
  factory _$$_PostCommentsEntityCopyWith(_$_PostCommentsEntity value,
          $Res Function(_$_PostCommentsEntity) then) =
      __$$_PostCommentsEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int last,
      int limit,
      int count,
      List<PostCommentEntity> comments,
      List<PostCommentEntity> commentsResponses});
}

/// @nodoc
class __$$_PostCommentsEntityCopyWithImpl<$Res>
    extends _$PostCommentsEntityCopyWithImpl<$Res, _$_PostCommentsEntity>
    implements _$$_PostCommentsEntityCopyWith<$Res> {
  __$$_PostCommentsEntityCopyWithImpl(
      _$_PostCommentsEntity _value, $Res Function(_$_PostCommentsEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? last = null,
    Object? limit = null,
    Object? count = null,
    Object? comments = null,
    Object? commentsResponses = null,
  }) {
    return _then(_$_PostCommentsEntity(
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
              as List<PostCommentEntity>,
      commentsResponses: null == commentsResponses
          ? _value._commentsResponses
          : commentsResponses // ignore: cast_nullable_to_non_nullable
              as List<PostCommentEntity>,
    ));
  }
}

/// @nodoc

class _$_PostCommentsEntity implements _PostCommentsEntity {
  const _$_PostCommentsEntity(
      {required this.last,
      required this.limit,
      required this.count,
      required final List<PostCommentEntity> comments,
      required final List<PostCommentEntity> commentsResponses})
      : _comments = comments,
        _commentsResponses = commentsResponses;

  @override
  final int last;
  @override
  final int limit;
  @override
  final int count;
  final List<PostCommentEntity> _comments;
  @override
  List<PostCommentEntity> get comments {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_comments);
  }

  final List<PostCommentEntity> _commentsResponses;
  @override
  List<PostCommentEntity> get commentsResponses {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_commentsResponses);
  }

  @override
  String toString() {
    return 'PostCommentsEntity(last: $last, limit: $limit, count: $count, comments: $comments, commentsResponses: $commentsResponses)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PostCommentsEntity &&
            (identical(other.last, last) || other.last == last) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.count, count) || other.count == count) &&
            const DeepCollectionEquality().equals(other._comments, _comments) &&
            const DeepCollectionEquality()
                .equals(other._commentsResponses, _commentsResponses));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      last,
      limit,
      count,
      const DeepCollectionEquality().hash(_comments),
      const DeepCollectionEquality().hash(_commentsResponses));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PostCommentsEntityCopyWith<_$_PostCommentsEntity> get copyWith =>
      __$$_PostCommentsEntityCopyWithImpl<_$_PostCommentsEntity>(
          this, _$identity);
}

abstract class _PostCommentsEntity implements PostCommentsEntity {
  const factory _PostCommentsEntity(
          {required final int last,
          required final int limit,
          required final int count,
          required final List<PostCommentEntity> comments,
          required final List<PostCommentEntity> commentsResponses}) =
      _$_PostCommentsEntity;

  @override
  int get last;
  @override
  int get limit;
  @override
  int get count;
  @override
  List<PostCommentEntity> get comments;
  @override
  List<PostCommentEntity> get commentsResponses;
  @override
  @JsonKey(ignore: true)
  _$$_PostCommentsEntityCopyWith<_$_PostCommentsEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
