// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_profile_statistic_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UserProfileStatisticEntity {
  String get trust => throw _privateConstructorUsedError;
  String get coins => throw _privateConstructorUsedError;
  List<int> get followers => throw _privateConstructorUsedError;
  List<int> get following => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserProfileStatisticEntityCopyWith<UserProfileStatisticEntity>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserProfileStatisticEntityCopyWith<$Res> {
  factory $UserProfileStatisticEntityCopyWith(UserProfileStatisticEntity value,
          $Res Function(UserProfileStatisticEntity) then) =
      _$UserProfileStatisticEntityCopyWithImpl<$Res,
          UserProfileStatisticEntity>;
  @useResult
  $Res call(
      {String trust, String coins, List<int> followers, List<int> following});
}

/// @nodoc
class _$UserProfileStatisticEntityCopyWithImpl<$Res,
        $Val extends UserProfileStatisticEntity>
    implements $UserProfileStatisticEntityCopyWith<$Res> {
  _$UserProfileStatisticEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? trust = null,
    Object? coins = null,
    Object? followers = null,
    Object? following = null,
  }) {
    return _then(_value.copyWith(
      trust: null == trust
          ? _value.trust
          : trust // ignore: cast_nullable_to_non_nullable
              as String,
      coins: null == coins
          ? _value.coins
          : coins // ignore: cast_nullable_to_non_nullable
              as String,
      followers: null == followers
          ? _value.followers
          : followers // ignore: cast_nullable_to_non_nullable
              as List<int>,
      following: null == following
          ? _value.following
          : following // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserProfileStatisticEntityCopyWith<$Res>
    implements $UserProfileStatisticEntityCopyWith<$Res> {
  factory _$$_UserProfileStatisticEntityCopyWith(
          _$_UserProfileStatisticEntity value,
          $Res Function(_$_UserProfileStatisticEntity) then) =
      __$$_UserProfileStatisticEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String trust, String coins, List<int> followers, List<int> following});
}

/// @nodoc
class __$$_UserProfileStatisticEntityCopyWithImpl<$Res>
    extends _$UserProfileStatisticEntityCopyWithImpl<$Res,
        _$_UserProfileStatisticEntity>
    implements _$$_UserProfileStatisticEntityCopyWith<$Res> {
  __$$_UserProfileStatisticEntityCopyWithImpl(
      _$_UserProfileStatisticEntity _value,
      $Res Function(_$_UserProfileStatisticEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? trust = null,
    Object? coins = null,
    Object? followers = null,
    Object? following = null,
  }) {
    return _then(_$_UserProfileStatisticEntity(
      trust: null == trust
          ? _value.trust
          : trust // ignore: cast_nullable_to_non_nullable
              as String,
      coins: null == coins
          ? _value.coins
          : coins // ignore: cast_nullable_to_non_nullable
              as String,
      followers: null == followers
          ? _value._followers
          : followers // ignore: cast_nullable_to_non_nullable
              as List<int>,
      following: null == following
          ? _value._following
          : following // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// @nodoc

class _$_UserProfileStatisticEntity implements _UserProfileStatisticEntity {
  const _$_UserProfileStatisticEntity(
      {required this.trust,
      required this.coins,
      required final List<int> followers,
      required final List<int> following})
      : _followers = followers,
        _following = following;

  @override
  final String trust;
  @override
  final String coins;
  final List<int> _followers;
  @override
  List<int> get followers {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_followers);
  }

  final List<int> _following;
  @override
  List<int> get following {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_following);
  }

  @override
  String toString() {
    return 'UserProfileStatisticEntity(trust: $trust, coins: $coins, followers: $followers, following: $following)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserProfileStatisticEntity &&
            (identical(other.trust, trust) || other.trust == trust) &&
            (identical(other.coins, coins) || other.coins == coins) &&
            const DeepCollectionEquality()
                .equals(other._followers, _followers) &&
            const DeepCollectionEquality()
                .equals(other._following, _following));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      trust,
      coins,
      const DeepCollectionEquality().hash(_followers),
      const DeepCollectionEquality().hash(_following));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserProfileStatisticEntityCopyWith<_$_UserProfileStatisticEntity>
      get copyWith => __$$_UserProfileStatisticEntityCopyWithImpl<
          _$_UserProfileStatisticEntity>(this, _$identity);
}

abstract class _UserProfileStatisticEntity
    implements UserProfileStatisticEntity {
  const factory _UserProfileStatisticEntity(
      {required final String trust,
      required final String coins,
      required final List<int> followers,
      required final List<int> following}) = _$_UserProfileStatisticEntity;

  @override
  String get trust;
  @override
  String get coins;
  @override
  List<int> get followers;
  @override
  List<int> get following;
  @override
  @JsonKey(ignore: true)
  _$$_UserProfileStatisticEntityCopyWith<_$_UserProfileStatisticEntity>
      get copyWith => throw _privateConstructorUsedError;
}
