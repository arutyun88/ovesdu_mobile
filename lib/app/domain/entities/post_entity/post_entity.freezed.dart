// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'post_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PostEntity {
  int get id => throw _privateConstructorUsedError;
  DateTime get created => throw _privateConstructorUsedError;
  DateTime get updated => throw _privateConstructorUsedError;
  String? get text => throw _privateConstructorUsedError;
  List<PostPhotoEntity> get photos => throw _privateConstructorUsedError;
  List<PostVideoEntity> get videos => throw _privateConstructorUsedError;
  int get like => throw _privateConstructorUsedError;
  int get dislike => throw _privateConstructorUsedError;
  bool? get liked => throw _privateConstructorUsedError;
  int get comment => throw _privateConstructorUsedError;
  AuthorEntity get author => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PostEntityCopyWith<PostEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostEntityCopyWith<$Res> {
  factory $PostEntityCopyWith(
          PostEntity value, $Res Function(PostEntity) then) =
      _$PostEntityCopyWithImpl<$Res, PostEntity>;
  @useResult
  $Res call(
      {int id,
      DateTime created,
      DateTime updated,
      String? text,
      List<PostPhotoEntity> photos,
      List<PostVideoEntity> videos,
      int like,
      int dislike,
      bool? liked,
      int comment,
      AuthorEntity author});

  $AuthorEntityCopyWith<$Res> get author;
}

/// @nodoc
class _$PostEntityCopyWithImpl<$Res, $Val extends PostEntity>
    implements $PostEntityCopyWith<$Res> {
  _$PostEntityCopyWithImpl(this._value, this._then);

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
              as List<PostPhotoEntity>,
      videos: null == videos
          ? _value.videos
          : videos // ignore: cast_nullable_to_non_nullable
              as List<PostVideoEntity>,
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
              as AuthorEntity,
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
abstract class _$$_PostEntityCopyWith<$Res>
    implements $PostEntityCopyWith<$Res> {
  factory _$$_PostEntityCopyWith(
          _$_PostEntity value, $Res Function(_$_PostEntity) then) =
      __$$_PostEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      DateTime created,
      DateTime updated,
      String? text,
      List<PostPhotoEntity> photos,
      List<PostVideoEntity> videos,
      int like,
      int dislike,
      bool? liked,
      int comment,
      AuthorEntity author});

  @override
  $AuthorEntityCopyWith<$Res> get author;
}

/// @nodoc
class __$$_PostEntityCopyWithImpl<$Res>
    extends _$PostEntityCopyWithImpl<$Res, _$_PostEntity>
    implements _$$_PostEntityCopyWith<$Res> {
  __$$_PostEntityCopyWithImpl(
      _$_PostEntity _value, $Res Function(_$_PostEntity) _then)
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
    return _then(_$_PostEntity(
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
              as List<PostPhotoEntity>,
      videos: null == videos
          ? _value._videos
          : videos // ignore: cast_nullable_to_non_nullable
              as List<PostVideoEntity>,
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
              as AuthorEntity,
    ));
  }
}

/// @nodoc

class _$_PostEntity implements _PostEntity {
  const _$_PostEntity(
      {required this.id,
      required this.created,
      required this.updated,
      required this.text,
      required final List<PostPhotoEntity> photos,
      required final List<PostVideoEntity> videos,
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
  final List<PostPhotoEntity> _photos;
  @override
  List<PostPhotoEntity> get photos {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_photos);
  }

  final List<PostVideoEntity> _videos;
  @override
  List<PostVideoEntity> get videos {
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
  final AuthorEntity author;

  @override
  String toString() {
    return 'PostEntity(id: $id, created: $created, updated: $updated, text: $text, photos: $photos, videos: $videos, like: $like, dislike: $dislike, liked: $liked, comment: $comment, author: $author)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PostEntity &&
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
  _$$_PostEntityCopyWith<_$_PostEntity> get copyWith =>
      __$$_PostEntityCopyWithImpl<_$_PostEntity>(this, _$identity);
}

abstract class _PostEntity implements PostEntity {
  const factory _PostEntity(
      {required final int id,
      required final DateTime created,
      required final DateTime updated,
      required final String? text,
      required final List<PostPhotoEntity> photos,
      required final List<PostVideoEntity> videos,
      required final int like,
      required final int dislike,
      required final bool? liked,
      required final int comment,
      required final AuthorEntity author}) = _$_PostEntity;

  @override
  int get id;
  @override
  DateTime get created;
  @override
  DateTime get updated;
  @override
  String? get text;
  @override
  List<PostPhotoEntity> get photos;
  @override
  List<PostVideoEntity> get videos;
  @override
  int get like;
  @override
  int get dislike;
  @override
  bool? get liked;
  @override
  int get comment;
  @override
  AuthorEntity get author;
  @override
  @JsonKey(ignore: true)
  _$$_PostEntityCopyWith<_$_PostEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
