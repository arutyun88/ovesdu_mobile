// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'posts_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PostsEntity {
  int get last => throw _privateConstructorUsedError;
  int get limit => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;
  List<PostEntity> get posts => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PostsEntityCopyWith<PostsEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostsEntityCopyWith<$Res> {
  factory $PostsEntityCopyWith(
          PostsEntity value, $Res Function(PostsEntity) then) =
      _$PostsEntityCopyWithImpl<$Res, PostsEntity>;
  @useResult
  $Res call({int last, int limit, int count, List<PostEntity> posts});
}

/// @nodoc
class _$PostsEntityCopyWithImpl<$Res, $Val extends PostsEntity>
    implements $PostsEntityCopyWith<$Res> {
  _$PostsEntityCopyWithImpl(this._value, this._then);

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
    Object? posts = null,
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
      posts: null == posts
          ? _value.posts
          : posts // ignore: cast_nullable_to_non_nullable
              as List<PostEntity>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PostsEntityCopyWith<$Res>
    implements $PostsEntityCopyWith<$Res> {
  factory _$$_PostsEntityCopyWith(
          _$_PostsEntity value, $Res Function(_$_PostsEntity) then) =
      __$$_PostsEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int last, int limit, int count, List<PostEntity> posts});
}

/// @nodoc
class __$$_PostsEntityCopyWithImpl<$Res>
    extends _$PostsEntityCopyWithImpl<$Res, _$_PostsEntity>
    implements _$$_PostsEntityCopyWith<$Res> {
  __$$_PostsEntityCopyWithImpl(
      _$_PostsEntity _value, $Res Function(_$_PostsEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? last = null,
    Object? limit = null,
    Object? count = null,
    Object? posts = null,
  }) {
    return _then(_$_PostsEntity(
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
      posts: null == posts
          ? _value._posts
          : posts // ignore: cast_nullable_to_non_nullable
              as List<PostEntity>,
    ));
  }
}

/// @nodoc

class _$_PostsEntity implements _PostsEntity {
  const _$_PostsEntity(
      {required this.last,
      required this.limit,
      required this.count,
      required final List<PostEntity> posts})
      : _posts = posts;

  @override
  final int last;
  @override
  final int limit;
  @override
  final int count;
  final List<PostEntity> _posts;
  @override
  List<PostEntity> get posts {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_posts);
  }

  @override
  String toString() {
    return 'PostsEntity(last: $last, limit: $limit, count: $count, posts: $posts)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PostsEntity &&
            (identical(other.last, last) || other.last == last) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.count, count) || other.count == count) &&
            const DeepCollectionEquality().equals(other._posts, _posts));
  }

  @override
  int get hashCode => Object.hash(runtimeType, last, limit, count,
      const DeepCollectionEquality().hash(_posts));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PostsEntityCopyWith<_$_PostsEntity> get copyWith =>
      __$$_PostsEntityCopyWithImpl<_$_PostsEntity>(this, _$identity);
}

abstract class _PostsEntity implements PostsEntity {
  const factory _PostsEntity(
      {required final int last,
      required final int limit,
      required final int count,
      required final List<PostEntity> posts}) = _$_PostsEntity;

  @override
  int get last;
  @override
  int get limit;
  @override
  int get count;
  @override
  List<PostEntity> get posts;
  @override
  @JsonKey(ignore: true)
  _$$_PostsEntityCopyWith<_$_PostsEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
