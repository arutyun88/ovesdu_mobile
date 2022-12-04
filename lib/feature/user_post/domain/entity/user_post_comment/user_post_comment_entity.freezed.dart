// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_post_comment_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UserPostCommentEntity {
  int get id => throw _privateConstructorUsedError;
  DateTime get created => throw _privateConstructorUsedError;
  DateTime get updated => throw _privateConstructorUsedError;
  String? get text => throw _privateConstructorUsedError;
  AuthorEntity get author => throw _privateConstructorUsedError;
  int? get toCommentId => throw _privateConstructorUsedError;
  int get like => throw _privateConstructorUsedError;
  int get dislike => throw _privateConstructorUsedError;
  bool? get liked => throw _privateConstructorUsedError;
  int get answers => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserPostCommentEntityCopyWith<UserPostCommentEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserPostCommentEntityCopyWith<$Res> {
  factory $UserPostCommentEntityCopyWith(UserPostCommentEntity value,
          $Res Function(UserPostCommentEntity) then) =
      _$UserPostCommentEntityCopyWithImpl<$Res, UserPostCommentEntity>;
  @useResult
  $Res call(
      {int id,
      DateTime created,
      DateTime updated,
      String? text,
      AuthorEntity author,
      int? toCommentId,
      int like,
      int dislike,
      bool? liked,
      int answers});

  $AuthorEntityCopyWith<$Res> get author;
}

/// @nodoc
class _$UserPostCommentEntityCopyWithImpl<$Res,
        $Val extends UserPostCommentEntity>
    implements $UserPostCommentEntityCopyWith<$Res> {
  _$UserPostCommentEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? created = null,
    Object? updated = null,
    Object? text = freezed,
    Object? author = null,
    Object? toCommentId = freezed,
    Object? like = null,
    Object? dislike = null,
    Object? liked = freezed,
    Object? answers = null,
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
      updated: null == updated
          ? _value.updated
          : updated // ignore: cast_nullable_to_non_nullable
              as DateTime,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as AuthorEntity,
      toCommentId: freezed == toCommentId
          ? _value.toCommentId
          : toCommentId // ignore: cast_nullable_to_non_nullable
              as int?,
      like: null == like
          ? _value.like
          : like // ignore: cast_nullable_to_non_nullable
              as int,
      dislike: null == dislike
          ? _value.dislike
          : dislike // ignore: cast_nullable_to_non_nullable
              as int,
      liked: freezed == liked
          ? _value.liked
          : liked // ignore: cast_nullable_to_non_nullable
              as bool?,
      answers: null == answers
          ? _value.answers
          : answers // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AuthorEntityCopyWith<$Res> get author {
    return $AuthorEntityCopyWith<$Res>(_value.author, (value) {
      return _then(_value.copyWith(author: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_UserPostCommentEntityCopyWith<$Res>
    implements $UserPostCommentEntityCopyWith<$Res> {
  factory _$$_UserPostCommentEntityCopyWith(_$_UserPostCommentEntity value,
          $Res Function(_$_UserPostCommentEntity) then) =
      __$$_UserPostCommentEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      DateTime created,
      DateTime updated,
      String? text,
      AuthorEntity author,
      int? toCommentId,
      int like,
      int dislike,
      bool? liked,
      int answers});

  @override
  $AuthorEntityCopyWith<$Res> get author;
}

/// @nodoc
class __$$_UserPostCommentEntityCopyWithImpl<$Res>
    extends _$UserPostCommentEntityCopyWithImpl<$Res, _$_UserPostCommentEntity>
    implements _$$_UserPostCommentEntityCopyWith<$Res> {
  __$$_UserPostCommentEntityCopyWithImpl(_$_UserPostCommentEntity _value,
      $Res Function(_$_UserPostCommentEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? created = null,
    Object? updated = null,
    Object? text = freezed,
    Object? author = null,
    Object? toCommentId = freezed,
    Object? like = null,
    Object? dislike = null,
    Object? liked = freezed,
    Object? answers = null,
  }) {
    return _then(_$_UserPostCommentEntity(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      created: null == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updated: null == updated
          ? _value.updated
          : updated // ignore: cast_nullable_to_non_nullable
              as DateTime,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as AuthorEntity,
      toCommentId: freezed == toCommentId
          ? _value.toCommentId
          : toCommentId // ignore: cast_nullable_to_non_nullable
              as int?,
      like: null == like
          ? _value.like
          : like // ignore: cast_nullable_to_non_nullable
              as int,
      dislike: null == dislike
          ? _value.dislike
          : dislike // ignore: cast_nullable_to_non_nullable
              as int,
      liked: freezed == liked
          ? _value.liked
          : liked // ignore: cast_nullable_to_non_nullable
              as bool?,
      answers: null == answers
          ? _value.answers
          : answers // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_UserPostCommentEntity implements _UserPostCommentEntity {
  const _$_UserPostCommentEntity(
      {required this.id,
      required this.created,
      required this.updated,
      required this.text,
      required this.author,
      required this.toCommentId,
      required this.like,
      required this.dislike,
      required this.liked,
      required this.answers});

  @override
  final int id;
  @override
  final DateTime created;
  @override
  final DateTime updated;
  @override
  final String? text;
  @override
  final AuthorEntity author;
  @override
  final int? toCommentId;
  @override
  final int like;
  @override
  final int dislike;
  @override
  final bool? liked;
  @override
  final int answers;

  @override
  String toString() {
    return 'UserPostCommentEntity(id: $id, created: $created, updated: $updated, text: $text, author: $author, toCommentId: $toCommentId, like: $like, dislike: $dislike, liked: $liked, answers: $answers)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserPostCommentEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.created, created) || other.created == created) &&
            (identical(other.updated, updated) || other.updated == updated) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.author, author) || other.author == author) &&
            (identical(other.toCommentId, toCommentId) ||
                other.toCommentId == toCommentId) &&
            (identical(other.like, like) || other.like == like) &&
            (identical(other.dislike, dislike) || other.dislike == dislike) &&
            (identical(other.liked, liked) || other.liked == liked) &&
            (identical(other.answers, answers) || other.answers == answers));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, created, updated, text,
      author, toCommentId, like, dislike, liked, answers);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserPostCommentEntityCopyWith<_$_UserPostCommentEntity> get copyWith =>
      __$$_UserPostCommentEntityCopyWithImpl<_$_UserPostCommentEntity>(
          this, _$identity);
}

abstract class _UserPostCommentEntity implements UserPostCommentEntity {
  const factory _UserPostCommentEntity(
      {required final int id,
      required final DateTime created,
      required final DateTime updated,
      required final String? text,
      required final AuthorEntity author,
      required final int? toCommentId,
      required final int like,
      required final int dislike,
      required final bool? liked,
      required final int answers}) = _$_UserPostCommentEntity;

  @override
  int get id;
  @override
  DateTime get created;
  @override
  DateTime get updated;
  @override
  String? get text;
  @override
  AuthorEntity get author;
  @override
  int? get toCommentId;
  @override
  int get like;
  @override
  int get dislike;
  @override
  bool? get liked;
  @override
  int get answers;
  @override
  @JsonKey(ignore: true)
  _$$_UserPostCommentEntityCopyWith<_$_UserPostCommentEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
