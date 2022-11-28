// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_posts_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UserPostsEntity {
  int get last => throw _privateConstructorUsedError;
  int get limit => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;
  List<UserPostEntity> get posts => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserPostsEntityCopyWith<UserPostsEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserPostsEntityCopyWith<$Res> {
  factory $UserPostsEntityCopyWith(
          UserPostsEntity value, $Res Function(UserPostsEntity) then) =
      _$UserPostsEntityCopyWithImpl<$Res, UserPostsEntity>;
  @useResult
  $Res call({int last, int limit, int count, List<UserPostEntity> posts});
}

/// @nodoc
class _$UserPostsEntityCopyWithImpl<$Res, $Val extends UserPostsEntity>
    implements $UserPostsEntityCopyWith<$Res> {
  _$UserPostsEntityCopyWithImpl(this._value, this._then);

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
              as List<UserPostEntity>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserPostsEntityCopyWith<$Res>
    implements $UserPostsEntityCopyWith<$Res> {
  factory _$$_UserPostsEntityCopyWith(
          _$_UserPostsEntity value, $Res Function(_$_UserPostsEntity) then) =
      __$$_UserPostsEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int last, int limit, int count, List<UserPostEntity> posts});
}

/// @nodoc
class __$$_UserPostsEntityCopyWithImpl<$Res>
    extends _$UserPostsEntityCopyWithImpl<$Res, _$_UserPostsEntity>
    implements _$$_UserPostsEntityCopyWith<$Res> {
  __$$_UserPostsEntityCopyWithImpl(
      _$_UserPostsEntity _value, $Res Function(_$_UserPostsEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? last = null,
    Object? limit = null,
    Object? count = null,
    Object? posts = null,
  }) {
    return _then(_$_UserPostsEntity(
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
              as List<UserPostEntity>,
    ));
  }
}

/// @nodoc

class _$_UserPostsEntity implements _UserPostsEntity {
  const _$_UserPostsEntity(
      {required this.last,
      required this.limit,
      required this.count,
      required final List<UserPostEntity> posts})
      : _posts = posts;

  @override
  final int last;
  @override
  final int limit;
  @override
  final int count;
  final List<UserPostEntity> _posts;
  @override
  List<UserPostEntity> get posts {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_posts);
  }

  @override
  String toString() {
    return 'UserPostsEntity(last: $last, limit: $limit, count: $count, posts: $posts)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserPostsEntity &&
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
  _$$_UserPostsEntityCopyWith<_$_UserPostsEntity> get copyWith =>
      __$$_UserPostsEntityCopyWithImpl<_$_UserPostsEntity>(this, _$identity);
}

abstract class _UserPostsEntity implements UserPostsEntity {
  const factory _UserPostsEntity(
      {required final int last,
      required final int limit,
      required final int count,
      required final List<UserPostEntity> posts}) = _$_UserPostsEntity;

  @override
  int get last;
  @override
  int get limit;
  @override
  int get count;
  @override
  List<UserPostEntity> get posts;
  @override
  @JsonKey(ignore: true)
  _$$_UserPostsEntityCopyWith<_$_UserPostsEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
