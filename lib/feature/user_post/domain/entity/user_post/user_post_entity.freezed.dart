// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_post_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UserPostEntity {
  int get id => throw _privateConstructorUsedError;
  DateTime get created => throw _privateConstructorUsedError;
  DateTime get updated => throw _privateConstructorUsedError;
  String? get text => throw _privateConstructorUsedError;
  List<UserPostPhotoEntity> get photos => throw _privateConstructorUsedError;
  List<UserPostVideoEntity> get videos => throw _privateConstructorUsedError;
  int get like => throw _privateConstructorUsedError;
  int get dislike => throw _privateConstructorUsedError;
  bool? get liked => throw _privateConstructorUsedError;
  int get comment => throw _privateConstructorUsedError;
  UserPostAuthorEntity get author => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserPostEntityCopyWith<UserPostEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserPostEntityCopyWith<$Res> {
  factory $UserPostEntityCopyWith(
          UserPostEntity value, $Res Function(UserPostEntity) then) =
      _$UserPostEntityCopyWithImpl<$Res, UserPostEntity>;
  @useResult
  $Res call(
      {int id,
      DateTime created,
      DateTime updated,
      String? text,
      List<UserPostPhotoEntity> photos,
      List<UserPostVideoEntity> videos,
      int like,
      int dislike,
      bool? liked,
      int comment,
      UserPostAuthorEntity author});

  $UserPostAuthorEntityCopyWith<$Res> get author;
}

/// @nodoc
class _$UserPostEntityCopyWithImpl<$Res, $Val extends UserPostEntity>
    implements $UserPostEntityCopyWith<$Res> {
  _$UserPostEntityCopyWithImpl(this._value, this._then);

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
    Object? photos = null,
    Object? videos = null,
    Object? like = null,
    Object? dislike = null,
    Object? liked = freezed,
    Object? comment = null,
    Object? author = null,
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
      photos: null == photos
          ? _value.photos
          : photos // ignore: cast_nullable_to_non_nullable
              as List<UserPostPhotoEntity>,
      videos: null == videos
          ? _value.videos
          : videos // ignore: cast_nullable_to_non_nullable
              as List<UserPostVideoEntity>,
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
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as int,
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as UserPostAuthorEntity,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserPostAuthorEntityCopyWith<$Res> get author {
    return $UserPostAuthorEntityCopyWith<$Res>(_value.author, (value) {
      return _then(_value.copyWith(author: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_UserPostEntityCopyWith<$Res>
    implements $UserPostEntityCopyWith<$Res> {
  factory _$$_UserPostEntityCopyWith(
          _$_UserPostEntity value, $Res Function(_$_UserPostEntity) then) =
      __$$_UserPostEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      DateTime created,
      DateTime updated,
      String? text,
      List<UserPostPhotoEntity> photos,
      List<UserPostVideoEntity> videos,
      int like,
      int dislike,
      bool? liked,
      int comment,
      UserPostAuthorEntity author});

  @override
  $UserPostAuthorEntityCopyWith<$Res> get author;
}

/// @nodoc
class __$$_UserPostEntityCopyWithImpl<$Res>
    extends _$UserPostEntityCopyWithImpl<$Res, _$_UserPostEntity>
    implements _$$_UserPostEntityCopyWith<$Res> {
  __$$_UserPostEntityCopyWithImpl(
      _$_UserPostEntity _value, $Res Function(_$_UserPostEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? created = null,
    Object? updated = null,
    Object? text = freezed,
    Object? photos = null,
    Object? videos = null,
    Object? like = null,
    Object? dislike = null,
    Object? liked = freezed,
    Object? comment = null,
    Object? author = null,
  }) {
    return _then(_$_UserPostEntity(
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
      photos: null == photos
          ? _value._photos
          : photos // ignore: cast_nullable_to_non_nullable
              as List<UserPostPhotoEntity>,
      videos: null == videos
          ? _value._videos
          : videos // ignore: cast_nullable_to_non_nullable
              as List<UserPostVideoEntity>,
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
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as int,
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as UserPostAuthorEntity,
    ));
  }
}

/// @nodoc

class _$_UserPostEntity implements _UserPostEntity {
  const _$_UserPostEntity(
      {required this.id,
      required this.created,
      required this.updated,
      required this.text,
      required final List<UserPostPhotoEntity> photos,
      required final List<UserPostVideoEntity> videos,
      required this.like,
      required this.dislike,
      required this.liked,
      required this.comment,
      required this.author})
      : _photos = photos,
        _videos = videos;

  @override
  final int id;
  @override
  final DateTime created;
  @override
  final DateTime updated;
  @override
  final String? text;
  final List<UserPostPhotoEntity> _photos;
  @override
  List<UserPostPhotoEntity> get photos {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_photos);
  }

  final List<UserPostVideoEntity> _videos;
  @override
  List<UserPostVideoEntity> get videos {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_videos);
  }

  @override
  final int like;
  @override
  final int dislike;
  @override
  final bool? liked;
  @override
  final int comment;
  @override
  final UserPostAuthorEntity author;

  @override
  String toString() {
    return 'UserPostEntity(id: $id, created: $created, updated: $updated, text: $text, photos: $photos, videos: $videos, like: $like, dislike: $dislike, liked: $liked, comment: $comment, author: $author)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserPostEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.created, created) || other.created == created) &&
            (identical(other.updated, updated) || other.updated == updated) &&
            (identical(other.text, text) || other.text == text) &&
            const DeepCollectionEquality().equals(other._photos, _photos) &&
            const DeepCollectionEquality().equals(other._videos, _videos) &&
            (identical(other.like, like) || other.like == like) &&
            (identical(other.dislike, dislike) || other.dislike == dislike) &&
            (identical(other.liked, liked) || other.liked == liked) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.author, author) || other.author == author));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      created,
      updated,
      text,
      const DeepCollectionEquality().hash(_photos),
      const DeepCollectionEquality().hash(_videos),
      like,
      dislike,
      liked,
      comment,
      author);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserPostEntityCopyWith<_$_UserPostEntity> get copyWith =>
      __$$_UserPostEntityCopyWithImpl<_$_UserPostEntity>(this, _$identity);
}

abstract class _UserPostEntity implements UserPostEntity {
  const factory _UserPostEntity(
      {required final int id,
      required final DateTime created,
      required final DateTime updated,
      required final String? text,
      required final List<UserPostPhotoEntity> photos,
      required final List<UserPostVideoEntity> videos,
      required final int like,
      required final int dislike,
      required final bool? liked,
      required final int comment,
      required final UserPostAuthorEntity author}) = _$_UserPostEntity;

  @override
  int get id;
  @override
  DateTime get created;
  @override
  DateTime get updated;
  @override
  String? get text;
  @override
  List<UserPostPhotoEntity> get photos;
  @override
  List<UserPostVideoEntity> get videos;
  @override
  int get like;
  @override
  int get dislike;
  @override
  bool? get liked;
  @override
  int get comment;
  @override
  UserPostAuthorEntity get author;
  @override
  @JsonKey(ignore: true)
  _$$_UserPostEntityCopyWith<_$_UserPostEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
