// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'auth_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AuthState _$AuthStateFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'notAuthorized':
      return _AuthStateNotAuthorized.fromJson(json);
    case 'authorized':
      return _AuthStateAuthorized.fromJson(json);
    case 'checked':
      return _AuthStateChecked.fromJson(json);
    case 'usernameChecked':
      return _AuthStateUsernameChecked.fromJson(json);
    case 'contactChecked':
      return _AuthStateContactChecked.fromJson(json);
    case 'waiting':
      return _AuthStateWaiting.fromJson(json);
    case 'error':
      return _AuthStateError.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'AuthState',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$AuthState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() notAuthorized,
    required TResult Function(TokenEntity tokenEntity) authorized,
    required TResult Function(String name) checked,
    required TResult Function() usernameChecked,
    required TResult Function() contactChecked,
    required TResult Function() waiting,
    required TResult Function(ErrorEntity error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? notAuthorized,
    TResult? Function(TokenEntity tokenEntity)? authorized,
    TResult? Function(String name)? checked,
    TResult? Function()? usernameChecked,
    TResult? Function()? contactChecked,
    TResult? Function()? waiting,
    TResult? Function(ErrorEntity error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? notAuthorized,
    TResult Function(TokenEntity tokenEntity)? authorized,
    TResult Function(String name)? checked,
    TResult Function()? usernameChecked,
    TResult Function()? contactChecked,
    TResult Function()? waiting,
    TResult Function(ErrorEntity error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthStateNotAuthorized value) notAuthorized,
    required TResult Function(_AuthStateAuthorized value) authorized,
    required TResult Function(_AuthStateChecked value) checked,
    required TResult Function(_AuthStateUsernameChecked value) usernameChecked,
    required TResult Function(_AuthStateContactChecked value) contactChecked,
    required TResult Function(_AuthStateWaiting value) waiting,
    required TResult Function(_AuthStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthStateNotAuthorized value)? notAuthorized,
    TResult? Function(_AuthStateAuthorized value)? authorized,
    TResult? Function(_AuthStateChecked value)? checked,
    TResult? Function(_AuthStateUsernameChecked value)? usernameChecked,
    TResult? Function(_AuthStateContactChecked value)? contactChecked,
    TResult? Function(_AuthStateWaiting value)? waiting,
    TResult? Function(_AuthStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthStateNotAuthorized value)? notAuthorized,
    TResult Function(_AuthStateAuthorized value)? authorized,
    TResult Function(_AuthStateChecked value)? checked,
    TResult Function(_AuthStateUsernameChecked value)? usernameChecked,
    TResult Function(_AuthStateContactChecked value)? contactChecked,
    TResult Function(_AuthStateWaiting value)? waiting,
    TResult Function(_AuthStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res, AuthState>;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res, $Val extends AuthState>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_AuthStateNotAuthorizedCopyWith<$Res> {
  factory _$$_AuthStateNotAuthorizedCopyWith(_$_AuthStateNotAuthorized value,
          $Res Function(_$_AuthStateNotAuthorized) then) =
      __$$_AuthStateNotAuthorizedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_AuthStateNotAuthorizedCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$_AuthStateNotAuthorized>
    implements _$$_AuthStateNotAuthorizedCopyWith<$Res> {
  __$$_AuthStateNotAuthorizedCopyWithImpl(_$_AuthStateNotAuthorized _value,
      $Res Function(_$_AuthStateNotAuthorized) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$_AuthStateNotAuthorized implements _AuthStateNotAuthorized {
  _$_AuthStateNotAuthorized({final String? $type})
      : $type = $type ?? 'notAuthorized';

  factory _$_AuthStateNotAuthorized.fromJson(Map<String, dynamic> json) =>
      _$$_AuthStateNotAuthorizedFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'AuthState.notAuthorized()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuthStateNotAuthorized);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() notAuthorized,
    required TResult Function(TokenEntity tokenEntity) authorized,
    required TResult Function(String name) checked,
    required TResult Function() usernameChecked,
    required TResult Function() contactChecked,
    required TResult Function() waiting,
    required TResult Function(ErrorEntity error) error,
  }) {
    return notAuthorized();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? notAuthorized,
    TResult? Function(TokenEntity tokenEntity)? authorized,
    TResult? Function(String name)? checked,
    TResult? Function()? usernameChecked,
    TResult? Function()? contactChecked,
    TResult? Function()? waiting,
    TResult? Function(ErrorEntity error)? error,
  }) {
    return notAuthorized?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? notAuthorized,
    TResult Function(TokenEntity tokenEntity)? authorized,
    TResult Function(String name)? checked,
    TResult Function()? usernameChecked,
    TResult Function()? contactChecked,
    TResult Function()? waiting,
    TResult Function(ErrorEntity error)? error,
    required TResult orElse(),
  }) {
    if (notAuthorized != null) {
      return notAuthorized();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthStateNotAuthorized value) notAuthorized,
    required TResult Function(_AuthStateAuthorized value) authorized,
    required TResult Function(_AuthStateChecked value) checked,
    required TResult Function(_AuthStateUsernameChecked value) usernameChecked,
    required TResult Function(_AuthStateContactChecked value) contactChecked,
    required TResult Function(_AuthStateWaiting value) waiting,
    required TResult Function(_AuthStateError value) error,
  }) {
    return notAuthorized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthStateNotAuthorized value)? notAuthorized,
    TResult? Function(_AuthStateAuthorized value)? authorized,
    TResult? Function(_AuthStateChecked value)? checked,
    TResult? Function(_AuthStateUsernameChecked value)? usernameChecked,
    TResult? Function(_AuthStateContactChecked value)? contactChecked,
    TResult? Function(_AuthStateWaiting value)? waiting,
    TResult? Function(_AuthStateError value)? error,
  }) {
    return notAuthorized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthStateNotAuthorized value)? notAuthorized,
    TResult Function(_AuthStateAuthorized value)? authorized,
    TResult Function(_AuthStateChecked value)? checked,
    TResult Function(_AuthStateUsernameChecked value)? usernameChecked,
    TResult Function(_AuthStateContactChecked value)? contactChecked,
    TResult Function(_AuthStateWaiting value)? waiting,
    TResult Function(_AuthStateError value)? error,
    required TResult orElse(),
  }) {
    if (notAuthorized != null) {
      return notAuthorized(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_AuthStateNotAuthorizedToJson(
      this,
    );
  }
}

abstract class _AuthStateNotAuthorized implements AuthState {
  factory _AuthStateNotAuthorized() = _$_AuthStateNotAuthorized;

  factory _AuthStateNotAuthorized.fromJson(Map<String, dynamic> json) =
      _$_AuthStateNotAuthorized.fromJson;
}

/// @nodoc
abstract class _$$_AuthStateAuthorizedCopyWith<$Res> {
  factory _$$_AuthStateAuthorizedCopyWith(_$_AuthStateAuthorized value,
          $Res Function(_$_AuthStateAuthorized) then) =
      __$$_AuthStateAuthorizedCopyWithImpl<$Res>;
  @useResult
  $Res call({TokenEntity tokenEntity});

  $TokenEntityCopyWith<$Res> get tokenEntity;
}

/// @nodoc
class __$$_AuthStateAuthorizedCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$_AuthStateAuthorized>
    implements _$$_AuthStateAuthorizedCopyWith<$Res> {
  __$$_AuthStateAuthorizedCopyWithImpl(_$_AuthStateAuthorized _value,
      $Res Function(_$_AuthStateAuthorized) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tokenEntity = null,
  }) {
    return _then(_$_AuthStateAuthorized(
      null == tokenEntity
          ? _value.tokenEntity
          : tokenEntity // ignore: cast_nullable_to_non_nullable
              as TokenEntity,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $TokenEntityCopyWith<$Res> get tokenEntity {
    return $TokenEntityCopyWith<$Res>(_value.tokenEntity, (value) {
      return _then(_value.copyWith(tokenEntity: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$_AuthStateAuthorized implements _AuthStateAuthorized {
  _$_AuthStateAuthorized(this.tokenEntity, {final String? $type})
      : $type = $type ?? 'authorized';

  factory _$_AuthStateAuthorized.fromJson(Map<String, dynamic> json) =>
      _$$_AuthStateAuthorizedFromJson(json);

  @override
  final TokenEntity tokenEntity;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'AuthState.authorized(tokenEntity: $tokenEntity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuthStateAuthorized &&
            (identical(other.tokenEntity, tokenEntity) ||
                other.tokenEntity == tokenEntity));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, tokenEntity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AuthStateAuthorizedCopyWith<_$_AuthStateAuthorized> get copyWith =>
      __$$_AuthStateAuthorizedCopyWithImpl<_$_AuthStateAuthorized>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() notAuthorized,
    required TResult Function(TokenEntity tokenEntity) authorized,
    required TResult Function(String name) checked,
    required TResult Function() usernameChecked,
    required TResult Function() contactChecked,
    required TResult Function() waiting,
    required TResult Function(ErrorEntity error) error,
  }) {
    return authorized(tokenEntity);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? notAuthorized,
    TResult? Function(TokenEntity tokenEntity)? authorized,
    TResult? Function(String name)? checked,
    TResult? Function()? usernameChecked,
    TResult? Function()? contactChecked,
    TResult? Function()? waiting,
    TResult? Function(ErrorEntity error)? error,
  }) {
    return authorized?.call(tokenEntity);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? notAuthorized,
    TResult Function(TokenEntity tokenEntity)? authorized,
    TResult Function(String name)? checked,
    TResult Function()? usernameChecked,
    TResult Function()? contactChecked,
    TResult Function()? waiting,
    TResult Function(ErrorEntity error)? error,
    required TResult orElse(),
  }) {
    if (authorized != null) {
      return authorized(tokenEntity);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthStateNotAuthorized value) notAuthorized,
    required TResult Function(_AuthStateAuthorized value) authorized,
    required TResult Function(_AuthStateChecked value) checked,
    required TResult Function(_AuthStateUsernameChecked value) usernameChecked,
    required TResult Function(_AuthStateContactChecked value) contactChecked,
    required TResult Function(_AuthStateWaiting value) waiting,
    required TResult Function(_AuthStateError value) error,
  }) {
    return authorized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthStateNotAuthorized value)? notAuthorized,
    TResult? Function(_AuthStateAuthorized value)? authorized,
    TResult? Function(_AuthStateChecked value)? checked,
    TResult? Function(_AuthStateUsernameChecked value)? usernameChecked,
    TResult? Function(_AuthStateContactChecked value)? contactChecked,
    TResult? Function(_AuthStateWaiting value)? waiting,
    TResult? Function(_AuthStateError value)? error,
  }) {
    return authorized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthStateNotAuthorized value)? notAuthorized,
    TResult Function(_AuthStateAuthorized value)? authorized,
    TResult Function(_AuthStateChecked value)? checked,
    TResult Function(_AuthStateUsernameChecked value)? usernameChecked,
    TResult Function(_AuthStateContactChecked value)? contactChecked,
    TResult Function(_AuthStateWaiting value)? waiting,
    TResult Function(_AuthStateError value)? error,
    required TResult orElse(),
  }) {
    if (authorized != null) {
      return authorized(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_AuthStateAuthorizedToJson(
      this,
    );
  }
}

abstract class _AuthStateAuthorized implements AuthState {
  factory _AuthStateAuthorized(final TokenEntity tokenEntity) =
      _$_AuthStateAuthorized;

  factory _AuthStateAuthorized.fromJson(Map<String, dynamic> json) =
      _$_AuthStateAuthorized.fromJson;

  TokenEntity get tokenEntity;
  @JsonKey(ignore: true)
  _$$_AuthStateAuthorizedCopyWith<_$_AuthStateAuthorized> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_AuthStateCheckedCopyWith<$Res> {
  factory _$$_AuthStateCheckedCopyWith(
          _$_AuthStateChecked value, $Res Function(_$_AuthStateChecked) then) =
      __$$_AuthStateCheckedCopyWithImpl<$Res>;
  @useResult
  $Res call({String name});
}

/// @nodoc
class __$$_AuthStateCheckedCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$_AuthStateChecked>
    implements _$$_AuthStateCheckedCopyWith<$Res> {
  __$$_AuthStateCheckedCopyWithImpl(
      _$_AuthStateChecked _value, $Res Function(_$_AuthStateChecked) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_$_AuthStateChecked(
      null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AuthStateChecked implements _AuthStateChecked {
  _$_AuthStateChecked(this.name, {final String? $type})
      : $type = $type ?? 'checked';

  factory _$_AuthStateChecked.fromJson(Map<String, dynamic> json) =>
      _$$_AuthStateCheckedFromJson(json);

  @override
  final String name;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'AuthState.checked(name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuthStateChecked &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AuthStateCheckedCopyWith<_$_AuthStateChecked> get copyWith =>
      __$$_AuthStateCheckedCopyWithImpl<_$_AuthStateChecked>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() notAuthorized,
    required TResult Function(TokenEntity tokenEntity) authorized,
    required TResult Function(String name) checked,
    required TResult Function() usernameChecked,
    required TResult Function() contactChecked,
    required TResult Function() waiting,
    required TResult Function(ErrorEntity error) error,
  }) {
    return checked(name);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? notAuthorized,
    TResult? Function(TokenEntity tokenEntity)? authorized,
    TResult? Function(String name)? checked,
    TResult? Function()? usernameChecked,
    TResult? Function()? contactChecked,
    TResult? Function()? waiting,
    TResult? Function(ErrorEntity error)? error,
  }) {
    return checked?.call(name);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? notAuthorized,
    TResult Function(TokenEntity tokenEntity)? authorized,
    TResult Function(String name)? checked,
    TResult Function()? usernameChecked,
    TResult Function()? contactChecked,
    TResult Function()? waiting,
    TResult Function(ErrorEntity error)? error,
    required TResult orElse(),
  }) {
    if (checked != null) {
      return checked(name);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthStateNotAuthorized value) notAuthorized,
    required TResult Function(_AuthStateAuthorized value) authorized,
    required TResult Function(_AuthStateChecked value) checked,
    required TResult Function(_AuthStateUsernameChecked value) usernameChecked,
    required TResult Function(_AuthStateContactChecked value) contactChecked,
    required TResult Function(_AuthStateWaiting value) waiting,
    required TResult Function(_AuthStateError value) error,
  }) {
    return checked(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthStateNotAuthorized value)? notAuthorized,
    TResult? Function(_AuthStateAuthorized value)? authorized,
    TResult? Function(_AuthStateChecked value)? checked,
    TResult? Function(_AuthStateUsernameChecked value)? usernameChecked,
    TResult? Function(_AuthStateContactChecked value)? contactChecked,
    TResult? Function(_AuthStateWaiting value)? waiting,
    TResult? Function(_AuthStateError value)? error,
  }) {
    return checked?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthStateNotAuthorized value)? notAuthorized,
    TResult Function(_AuthStateAuthorized value)? authorized,
    TResult Function(_AuthStateChecked value)? checked,
    TResult Function(_AuthStateUsernameChecked value)? usernameChecked,
    TResult Function(_AuthStateContactChecked value)? contactChecked,
    TResult Function(_AuthStateWaiting value)? waiting,
    TResult Function(_AuthStateError value)? error,
    required TResult orElse(),
  }) {
    if (checked != null) {
      return checked(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_AuthStateCheckedToJson(
      this,
    );
  }
}

abstract class _AuthStateChecked implements AuthState {
  factory _AuthStateChecked(final String name) = _$_AuthStateChecked;

  factory _AuthStateChecked.fromJson(Map<String, dynamic> json) =
      _$_AuthStateChecked.fromJson;

  String get name;
  @JsonKey(ignore: true)
  _$$_AuthStateCheckedCopyWith<_$_AuthStateChecked> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_AuthStateUsernameCheckedCopyWith<$Res> {
  factory _$$_AuthStateUsernameCheckedCopyWith(
          _$_AuthStateUsernameChecked value,
          $Res Function(_$_AuthStateUsernameChecked) then) =
      __$$_AuthStateUsernameCheckedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_AuthStateUsernameCheckedCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$_AuthStateUsernameChecked>
    implements _$$_AuthStateUsernameCheckedCopyWith<$Res> {
  __$$_AuthStateUsernameCheckedCopyWithImpl(_$_AuthStateUsernameChecked _value,
      $Res Function(_$_AuthStateUsernameChecked) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$_AuthStateUsernameChecked implements _AuthStateUsernameChecked {
  _$_AuthStateUsernameChecked({final String? $type})
      : $type = $type ?? 'usernameChecked';

  factory _$_AuthStateUsernameChecked.fromJson(Map<String, dynamic> json) =>
      _$$_AuthStateUsernameCheckedFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'AuthState.usernameChecked()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuthStateUsernameChecked);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() notAuthorized,
    required TResult Function(TokenEntity tokenEntity) authorized,
    required TResult Function(String name) checked,
    required TResult Function() usernameChecked,
    required TResult Function() contactChecked,
    required TResult Function() waiting,
    required TResult Function(ErrorEntity error) error,
  }) {
    return usernameChecked();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? notAuthorized,
    TResult? Function(TokenEntity tokenEntity)? authorized,
    TResult? Function(String name)? checked,
    TResult? Function()? usernameChecked,
    TResult? Function()? contactChecked,
    TResult? Function()? waiting,
    TResult? Function(ErrorEntity error)? error,
  }) {
    return usernameChecked?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? notAuthorized,
    TResult Function(TokenEntity tokenEntity)? authorized,
    TResult Function(String name)? checked,
    TResult Function()? usernameChecked,
    TResult Function()? contactChecked,
    TResult Function()? waiting,
    TResult Function(ErrorEntity error)? error,
    required TResult orElse(),
  }) {
    if (usernameChecked != null) {
      return usernameChecked();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthStateNotAuthorized value) notAuthorized,
    required TResult Function(_AuthStateAuthorized value) authorized,
    required TResult Function(_AuthStateChecked value) checked,
    required TResult Function(_AuthStateUsernameChecked value) usernameChecked,
    required TResult Function(_AuthStateContactChecked value) contactChecked,
    required TResult Function(_AuthStateWaiting value) waiting,
    required TResult Function(_AuthStateError value) error,
  }) {
    return usernameChecked(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthStateNotAuthorized value)? notAuthorized,
    TResult? Function(_AuthStateAuthorized value)? authorized,
    TResult? Function(_AuthStateChecked value)? checked,
    TResult? Function(_AuthStateUsernameChecked value)? usernameChecked,
    TResult? Function(_AuthStateContactChecked value)? contactChecked,
    TResult? Function(_AuthStateWaiting value)? waiting,
    TResult? Function(_AuthStateError value)? error,
  }) {
    return usernameChecked?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthStateNotAuthorized value)? notAuthorized,
    TResult Function(_AuthStateAuthorized value)? authorized,
    TResult Function(_AuthStateChecked value)? checked,
    TResult Function(_AuthStateUsernameChecked value)? usernameChecked,
    TResult Function(_AuthStateContactChecked value)? contactChecked,
    TResult Function(_AuthStateWaiting value)? waiting,
    TResult Function(_AuthStateError value)? error,
    required TResult orElse(),
  }) {
    if (usernameChecked != null) {
      return usernameChecked(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_AuthStateUsernameCheckedToJson(
      this,
    );
  }
}

abstract class _AuthStateUsernameChecked implements AuthState {
  factory _AuthStateUsernameChecked() = _$_AuthStateUsernameChecked;

  factory _AuthStateUsernameChecked.fromJson(Map<String, dynamic> json) =
      _$_AuthStateUsernameChecked.fromJson;
}

/// @nodoc
abstract class _$$_AuthStateContactCheckedCopyWith<$Res> {
  factory _$$_AuthStateContactCheckedCopyWith(_$_AuthStateContactChecked value,
          $Res Function(_$_AuthStateContactChecked) then) =
      __$$_AuthStateContactCheckedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_AuthStateContactCheckedCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$_AuthStateContactChecked>
    implements _$$_AuthStateContactCheckedCopyWith<$Res> {
  __$$_AuthStateContactCheckedCopyWithImpl(_$_AuthStateContactChecked _value,
      $Res Function(_$_AuthStateContactChecked) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$_AuthStateContactChecked implements _AuthStateContactChecked {
  _$_AuthStateContactChecked({final String? $type})
      : $type = $type ?? 'contactChecked';

  factory _$_AuthStateContactChecked.fromJson(Map<String, dynamic> json) =>
      _$$_AuthStateContactCheckedFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'AuthState.contactChecked()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuthStateContactChecked);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() notAuthorized,
    required TResult Function(TokenEntity tokenEntity) authorized,
    required TResult Function(String name) checked,
    required TResult Function() usernameChecked,
    required TResult Function() contactChecked,
    required TResult Function() waiting,
    required TResult Function(ErrorEntity error) error,
  }) {
    return contactChecked();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? notAuthorized,
    TResult? Function(TokenEntity tokenEntity)? authorized,
    TResult? Function(String name)? checked,
    TResult? Function()? usernameChecked,
    TResult? Function()? contactChecked,
    TResult? Function()? waiting,
    TResult? Function(ErrorEntity error)? error,
  }) {
    return contactChecked?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? notAuthorized,
    TResult Function(TokenEntity tokenEntity)? authorized,
    TResult Function(String name)? checked,
    TResult Function()? usernameChecked,
    TResult Function()? contactChecked,
    TResult Function()? waiting,
    TResult Function(ErrorEntity error)? error,
    required TResult orElse(),
  }) {
    if (contactChecked != null) {
      return contactChecked();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthStateNotAuthorized value) notAuthorized,
    required TResult Function(_AuthStateAuthorized value) authorized,
    required TResult Function(_AuthStateChecked value) checked,
    required TResult Function(_AuthStateUsernameChecked value) usernameChecked,
    required TResult Function(_AuthStateContactChecked value) contactChecked,
    required TResult Function(_AuthStateWaiting value) waiting,
    required TResult Function(_AuthStateError value) error,
  }) {
    return contactChecked(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthStateNotAuthorized value)? notAuthorized,
    TResult? Function(_AuthStateAuthorized value)? authorized,
    TResult? Function(_AuthStateChecked value)? checked,
    TResult? Function(_AuthStateUsernameChecked value)? usernameChecked,
    TResult? Function(_AuthStateContactChecked value)? contactChecked,
    TResult? Function(_AuthStateWaiting value)? waiting,
    TResult? Function(_AuthStateError value)? error,
  }) {
    return contactChecked?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthStateNotAuthorized value)? notAuthorized,
    TResult Function(_AuthStateAuthorized value)? authorized,
    TResult Function(_AuthStateChecked value)? checked,
    TResult Function(_AuthStateUsernameChecked value)? usernameChecked,
    TResult Function(_AuthStateContactChecked value)? contactChecked,
    TResult Function(_AuthStateWaiting value)? waiting,
    TResult Function(_AuthStateError value)? error,
    required TResult orElse(),
  }) {
    if (contactChecked != null) {
      return contactChecked(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_AuthStateContactCheckedToJson(
      this,
    );
  }
}

abstract class _AuthStateContactChecked implements AuthState {
  factory _AuthStateContactChecked() = _$_AuthStateContactChecked;

  factory _AuthStateContactChecked.fromJson(Map<String, dynamic> json) =
      _$_AuthStateContactChecked.fromJson;
}

/// @nodoc
abstract class _$$_AuthStateWaitingCopyWith<$Res> {
  factory _$$_AuthStateWaitingCopyWith(
          _$_AuthStateWaiting value, $Res Function(_$_AuthStateWaiting) then) =
      __$$_AuthStateWaitingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_AuthStateWaitingCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$_AuthStateWaiting>
    implements _$$_AuthStateWaitingCopyWith<$Res> {
  __$$_AuthStateWaitingCopyWithImpl(
      _$_AuthStateWaiting _value, $Res Function(_$_AuthStateWaiting) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$_AuthStateWaiting implements _AuthStateWaiting {
  _$_AuthStateWaiting({final String? $type}) : $type = $type ?? 'waiting';

  factory _$_AuthStateWaiting.fromJson(Map<String, dynamic> json) =>
      _$$_AuthStateWaitingFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'AuthState.waiting()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_AuthStateWaiting);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() notAuthorized,
    required TResult Function(TokenEntity tokenEntity) authorized,
    required TResult Function(String name) checked,
    required TResult Function() usernameChecked,
    required TResult Function() contactChecked,
    required TResult Function() waiting,
    required TResult Function(ErrorEntity error) error,
  }) {
    return waiting();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? notAuthorized,
    TResult? Function(TokenEntity tokenEntity)? authorized,
    TResult? Function(String name)? checked,
    TResult? Function()? usernameChecked,
    TResult? Function()? contactChecked,
    TResult? Function()? waiting,
    TResult? Function(ErrorEntity error)? error,
  }) {
    return waiting?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? notAuthorized,
    TResult Function(TokenEntity tokenEntity)? authorized,
    TResult Function(String name)? checked,
    TResult Function()? usernameChecked,
    TResult Function()? contactChecked,
    TResult Function()? waiting,
    TResult Function(ErrorEntity error)? error,
    required TResult orElse(),
  }) {
    if (waiting != null) {
      return waiting();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthStateNotAuthorized value) notAuthorized,
    required TResult Function(_AuthStateAuthorized value) authorized,
    required TResult Function(_AuthStateChecked value) checked,
    required TResult Function(_AuthStateUsernameChecked value) usernameChecked,
    required TResult Function(_AuthStateContactChecked value) contactChecked,
    required TResult Function(_AuthStateWaiting value) waiting,
    required TResult Function(_AuthStateError value) error,
  }) {
    return waiting(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthStateNotAuthorized value)? notAuthorized,
    TResult? Function(_AuthStateAuthorized value)? authorized,
    TResult? Function(_AuthStateChecked value)? checked,
    TResult? Function(_AuthStateUsernameChecked value)? usernameChecked,
    TResult? Function(_AuthStateContactChecked value)? contactChecked,
    TResult? Function(_AuthStateWaiting value)? waiting,
    TResult? Function(_AuthStateError value)? error,
  }) {
    return waiting?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthStateNotAuthorized value)? notAuthorized,
    TResult Function(_AuthStateAuthorized value)? authorized,
    TResult Function(_AuthStateChecked value)? checked,
    TResult Function(_AuthStateUsernameChecked value)? usernameChecked,
    TResult Function(_AuthStateContactChecked value)? contactChecked,
    TResult Function(_AuthStateWaiting value)? waiting,
    TResult Function(_AuthStateError value)? error,
    required TResult orElse(),
  }) {
    if (waiting != null) {
      return waiting(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_AuthStateWaitingToJson(
      this,
    );
  }
}

abstract class _AuthStateWaiting implements AuthState {
  factory _AuthStateWaiting() = _$_AuthStateWaiting;

  factory _AuthStateWaiting.fromJson(Map<String, dynamic> json) =
      _$_AuthStateWaiting.fromJson;
}

/// @nodoc
abstract class _$$_AuthStateErrorCopyWith<$Res> {
  factory _$$_AuthStateErrorCopyWith(
          _$_AuthStateError value, $Res Function(_$_AuthStateError) then) =
      __$$_AuthStateErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({ErrorEntity error});

  $ErrorEntityCopyWith<$Res> get error;
}

/// @nodoc
class __$$_AuthStateErrorCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$_AuthStateError>
    implements _$$_AuthStateErrorCopyWith<$Res> {
  __$$_AuthStateErrorCopyWithImpl(
      _$_AuthStateError _value, $Res Function(_$_AuthStateError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$_AuthStateError(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as ErrorEntity,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ErrorEntityCopyWith<$Res> get error {
    return $ErrorEntityCopyWith<$Res>(_value.error, (value) {
      return _then(_value.copyWith(error: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$_AuthStateError implements _AuthStateError {
  _$_AuthStateError(this.error, {final String? $type})
      : $type = $type ?? 'error';

  factory _$_AuthStateError.fromJson(Map<String, dynamic> json) =>
      _$$_AuthStateErrorFromJson(json);

  @override
  final ErrorEntity error;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'AuthState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuthStateError &&
            (identical(other.error, error) || other.error == error));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AuthStateErrorCopyWith<_$_AuthStateError> get copyWith =>
      __$$_AuthStateErrorCopyWithImpl<_$_AuthStateError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() notAuthorized,
    required TResult Function(TokenEntity tokenEntity) authorized,
    required TResult Function(String name) checked,
    required TResult Function() usernameChecked,
    required TResult Function() contactChecked,
    required TResult Function() waiting,
    required TResult Function(ErrorEntity error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? notAuthorized,
    TResult? Function(TokenEntity tokenEntity)? authorized,
    TResult? Function(String name)? checked,
    TResult? Function()? usernameChecked,
    TResult? Function()? contactChecked,
    TResult? Function()? waiting,
    TResult? Function(ErrorEntity error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? notAuthorized,
    TResult Function(TokenEntity tokenEntity)? authorized,
    TResult Function(String name)? checked,
    TResult Function()? usernameChecked,
    TResult Function()? contactChecked,
    TResult Function()? waiting,
    TResult Function(ErrorEntity error)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthStateNotAuthorized value) notAuthorized,
    required TResult Function(_AuthStateAuthorized value) authorized,
    required TResult Function(_AuthStateChecked value) checked,
    required TResult Function(_AuthStateUsernameChecked value) usernameChecked,
    required TResult Function(_AuthStateContactChecked value) contactChecked,
    required TResult Function(_AuthStateWaiting value) waiting,
    required TResult Function(_AuthStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthStateNotAuthorized value)? notAuthorized,
    TResult? Function(_AuthStateAuthorized value)? authorized,
    TResult? Function(_AuthStateChecked value)? checked,
    TResult? Function(_AuthStateUsernameChecked value)? usernameChecked,
    TResult? Function(_AuthStateContactChecked value)? contactChecked,
    TResult? Function(_AuthStateWaiting value)? waiting,
    TResult? Function(_AuthStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthStateNotAuthorized value)? notAuthorized,
    TResult Function(_AuthStateAuthorized value)? authorized,
    TResult Function(_AuthStateChecked value)? checked,
    TResult Function(_AuthStateUsernameChecked value)? usernameChecked,
    TResult Function(_AuthStateContactChecked value)? contactChecked,
    TResult Function(_AuthStateWaiting value)? waiting,
    TResult Function(_AuthStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_AuthStateErrorToJson(
      this,
    );
  }
}

abstract class _AuthStateError implements AuthState {
  factory _AuthStateError(final ErrorEntity error) = _$_AuthStateError;

  factory _AuthStateError.fromJson(Map<String, dynamic> json) =
      _$_AuthStateError.fromJson;

  ErrorEntity get error;
  @JsonKey(ignore: true)
  _$$_AuthStateErrorCopyWith<_$_AuthStateError> get copyWith =>
      throw _privateConstructorUsedError;
}
