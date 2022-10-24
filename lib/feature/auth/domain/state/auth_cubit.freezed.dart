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

/// @nodoc
mixin _$AuthState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() notAuthorized,
    required TResult Function(TokenEntity tokenEntity) authorized,
    required TResult Function(String name) checked,
    required TResult Function() waiting,
    required TResult Function(dynamic error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? notAuthorized,
    TResult Function(TokenEntity tokenEntity)? authorized,
    TResult Function(String name)? checked,
    TResult Function()? waiting,
    TResult Function(dynamic error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? notAuthorized,
    TResult Function(TokenEntity tokenEntity)? authorized,
    TResult Function(String name)? checked,
    TResult Function()? waiting,
    TResult Function(dynamic error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthStateNotAuthorized value) notAuthorized,
    required TResult Function(_AuthStateAuthorized value) authorized,
    required TResult Function(_AuthStateChecked value) checked,
    required TResult Function(_AuthStateWaiting value) waiting,
    required TResult Function(_AuthStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_AuthStateNotAuthorized value)? notAuthorized,
    TResult Function(_AuthStateAuthorized value)? authorized,
    TResult Function(_AuthStateChecked value)? checked,
    TResult Function(_AuthStateWaiting value)? waiting,
    TResult Function(_AuthStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthStateNotAuthorized value)? notAuthorized,
    TResult Function(_AuthStateAuthorized value)? authorized,
    TResult Function(_AuthStateChecked value)? checked,
    TResult Function(_AuthStateWaiting value)? waiting,
    TResult Function(_AuthStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res> implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  final AuthState _value;
  // ignore: unused_field
  final $Res Function(AuthState) _then;
}

/// @nodoc
abstract class _$$_AuthStateNotAuthorizedCopyWith<$Res> {
  factory _$$_AuthStateNotAuthorizedCopyWith(_$_AuthStateNotAuthorized value,
          $Res Function(_$_AuthStateNotAuthorized) then) =
      __$$_AuthStateNotAuthorizedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_AuthStateNotAuthorizedCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res>
    implements _$$_AuthStateNotAuthorizedCopyWith<$Res> {
  __$$_AuthStateNotAuthorizedCopyWithImpl(_$_AuthStateNotAuthorized _value,
      $Res Function(_$_AuthStateNotAuthorized) _then)
      : super(_value, (v) => _then(v as _$_AuthStateNotAuthorized));

  @override
  _$_AuthStateNotAuthorized get _value =>
      super._value as _$_AuthStateNotAuthorized;
}

/// @nodoc

class _$_AuthStateNotAuthorized implements _AuthStateNotAuthorized {
  _$_AuthStateNotAuthorized();

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

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() notAuthorized,
    required TResult Function(TokenEntity tokenEntity) authorized,
    required TResult Function(String name) checked,
    required TResult Function() waiting,
    required TResult Function(dynamic error) error,
  }) {
    return notAuthorized();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? notAuthorized,
    TResult Function(TokenEntity tokenEntity)? authorized,
    TResult Function(String name)? checked,
    TResult Function()? waiting,
    TResult Function(dynamic error)? error,
  }) {
    return notAuthorized?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? notAuthorized,
    TResult Function(TokenEntity tokenEntity)? authorized,
    TResult Function(String name)? checked,
    TResult Function()? waiting,
    TResult Function(dynamic error)? error,
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
    required TResult Function(_AuthStateWaiting value) waiting,
    required TResult Function(_AuthStateError value) error,
  }) {
    return notAuthorized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_AuthStateNotAuthorized value)? notAuthorized,
    TResult Function(_AuthStateAuthorized value)? authorized,
    TResult Function(_AuthStateChecked value)? checked,
    TResult Function(_AuthStateWaiting value)? waiting,
    TResult Function(_AuthStateError value)? error,
  }) {
    return notAuthorized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthStateNotAuthorized value)? notAuthorized,
    TResult Function(_AuthStateAuthorized value)? authorized,
    TResult Function(_AuthStateChecked value)? checked,
    TResult Function(_AuthStateWaiting value)? waiting,
    TResult Function(_AuthStateError value)? error,
    required TResult orElse(),
  }) {
    if (notAuthorized != null) {
      return notAuthorized(this);
    }
    return orElse();
  }
}

abstract class _AuthStateNotAuthorized implements AuthState {
  factory _AuthStateNotAuthorized() = _$_AuthStateNotAuthorized;
}

/// @nodoc
abstract class _$$_AuthStateAuthorizedCopyWith<$Res> {
  factory _$$_AuthStateAuthorizedCopyWith(_$_AuthStateAuthorized value,
          $Res Function(_$_AuthStateAuthorized) then) =
      __$$_AuthStateAuthorizedCopyWithImpl<$Res>;
  $Res call({TokenEntity tokenEntity});
}

/// @nodoc
class __$$_AuthStateAuthorizedCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res>
    implements _$$_AuthStateAuthorizedCopyWith<$Res> {
  __$$_AuthStateAuthorizedCopyWithImpl(_$_AuthStateAuthorized _value,
      $Res Function(_$_AuthStateAuthorized) _then)
      : super(_value, (v) => _then(v as _$_AuthStateAuthorized));

  @override
  _$_AuthStateAuthorized get _value => super._value as _$_AuthStateAuthorized;

  @override
  $Res call({
    Object? tokenEntity = freezed,
  }) {
    return _then(_$_AuthStateAuthorized(
      tokenEntity == freezed
          ? _value.tokenEntity
          : tokenEntity // ignore: cast_nullable_to_non_nullable
              as TokenEntity,
    ));
  }
}

/// @nodoc

class _$_AuthStateAuthorized implements _AuthStateAuthorized {
  _$_AuthStateAuthorized(this.tokenEntity);

  @override
  final TokenEntity tokenEntity;

  @override
  String toString() {
    return 'AuthState.authorized(tokenEntity: $tokenEntity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuthStateAuthorized &&
            const DeepCollectionEquality()
                .equals(other.tokenEntity, tokenEntity));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(tokenEntity));

  @JsonKey(ignore: true)
  @override
  _$$_AuthStateAuthorizedCopyWith<_$_AuthStateAuthorized> get copyWith =>
      __$$_AuthStateAuthorizedCopyWithImpl<_$_AuthStateAuthorized>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() notAuthorized,
    required TResult Function(TokenEntity tokenEntity) authorized,
    required TResult Function(String name) checked,
    required TResult Function() waiting,
    required TResult Function(dynamic error) error,
  }) {
    return authorized(tokenEntity);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? notAuthorized,
    TResult Function(TokenEntity tokenEntity)? authorized,
    TResult Function(String name)? checked,
    TResult Function()? waiting,
    TResult Function(dynamic error)? error,
  }) {
    return authorized?.call(tokenEntity);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? notAuthorized,
    TResult Function(TokenEntity tokenEntity)? authorized,
    TResult Function(String name)? checked,
    TResult Function()? waiting,
    TResult Function(dynamic error)? error,
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
    required TResult Function(_AuthStateWaiting value) waiting,
    required TResult Function(_AuthStateError value) error,
  }) {
    return authorized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_AuthStateNotAuthorized value)? notAuthorized,
    TResult Function(_AuthStateAuthorized value)? authorized,
    TResult Function(_AuthStateChecked value)? checked,
    TResult Function(_AuthStateWaiting value)? waiting,
    TResult Function(_AuthStateError value)? error,
  }) {
    return authorized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthStateNotAuthorized value)? notAuthorized,
    TResult Function(_AuthStateAuthorized value)? authorized,
    TResult Function(_AuthStateChecked value)? checked,
    TResult Function(_AuthStateWaiting value)? waiting,
    TResult Function(_AuthStateError value)? error,
    required TResult orElse(),
  }) {
    if (authorized != null) {
      return authorized(this);
    }
    return orElse();
  }
}

abstract class _AuthStateAuthorized implements AuthState {
  factory _AuthStateAuthorized(final TokenEntity tokenEntity) =
      _$_AuthStateAuthorized;

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
  $Res call({String name});
}

/// @nodoc
class __$$_AuthStateCheckedCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res>
    implements _$$_AuthStateCheckedCopyWith<$Res> {
  __$$_AuthStateCheckedCopyWithImpl(
      _$_AuthStateChecked _value, $Res Function(_$_AuthStateChecked) _then)
      : super(_value, (v) => _then(v as _$_AuthStateChecked));

  @override
  _$_AuthStateChecked get _value => super._value as _$_AuthStateChecked;

  @override
  $Res call({
    Object? name = freezed,
  }) {
    return _then(_$_AuthStateChecked(
      name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_AuthStateChecked implements _AuthStateChecked {
  _$_AuthStateChecked(this.name);

  @override
  final String name;

  @override
  String toString() {
    return 'AuthState.checked(name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuthStateChecked &&
            const DeepCollectionEquality().equals(other.name, name));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(name));

  @JsonKey(ignore: true)
  @override
  _$$_AuthStateCheckedCopyWith<_$_AuthStateChecked> get copyWith =>
      __$$_AuthStateCheckedCopyWithImpl<_$_AuthStateChecked>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() notAuthorized,
    required TResult Function(TokenEntity tokenEntity) authorized,
    required TResult Function(String name) checked,
    required TResult Function() waiting,
    required TResult Function(dynamic error) error,
  }) {
    return checked(name);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? notAuthorized,
    TResult Function(TokenEntity tokenEntity)? authorized,
    TResult Function(String name)? checked,
    TResult Function()? waiting,
    TResult Function(dynamic error)? error,
  }) {
    return checked?.call(name);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? notAuthorized,
    TResult Function(TokenEntity tokenEntity)? authorized,
    TResult Function(String name)? checked,
    TResult Function()? waiting,
    TResult Function(dynamic error)? error,
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
    required TResult Function(_AuthStateWaiting value) waiting,
    required TResult Function(_AuthStateError value) error,
  }) {
    return checked(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_AuthStateNotAuthorized value)? notAuthorized,
    TResult Function(_AuthStateAuthorized value)? authorized,
    TResult Function(_AuthStateChecked value)? checked,
    TResult Function(_AuthStateWaiting value)? waiting,
    TResult Function(_AuthStateError value)? error,
  }) {
    return checked?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthStateNotAuthorized value)? notAuthorized,
    TResult Function(_AuthStateAuthorized value)? authorized,
    TResult Function(_AuthStateChecked value)? checked,
    TResult Function(_AuthStateWaiting value)? waiting,
    TResult Function(_AuthStateError value)? error,
    required TResult orElse(),
  }) {
    if (checked != null) {
      return checked(this);
    }
    return orElse();
  }
}

abstract class _AuthStateChecked implements AuthState {
  factory _AuthStateChecked(final String name) = _$_AuthStateChecked;

  String get name;
  @JsonKey(ignore: true)
  _$$_AuthStateCheckedCopyWith<_$_AuthStateChecked> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_AuthStateWaitingCopyWith<$Res> {
  factory _$$_AuthStateWaitingCopyWith(
          _$_AuthStateWaiting value, $Res Function(_$_AuthStateWaiting) then) =
      __$$_AuthStateWaitingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_AuthStateWaitingCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res>
    implements _$$_AuthStateWaitingCopyWith<$Res> {
  __$$_AuthStateWaitingCopyWithImpl(
      _$_AuthStateWaiting _value, $Res Function(_$_AuthStateWaiting) _then)
      : super(_value, (v) => _then(v as _$_AuthStateWaiting));

  @override
  _$_AuthStateWaiting get _value => super._value as _$_AuthStateWaiting;
}

/// @nodoc

class _$_AuthStateWaiting implements _AuthStateWaiting {
  _$_AuthStateWaiting();

  @override
  String toString() {
    return 'AuthState.waiting()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_AuthStateWaiting);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() notAuthorized,
    required TResult Function(TokenEntity tokenEntity) authorized,
    required TResult Function(String name) checked,
    required TResult Function() waiting,
    required TResult Function(dynamic error) error,
  }) {
    return waiting();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? notAuthorized,
    TResult Function(TokenEntity tokenEntity)? authorized,
    TResult Function(String name)? checked,
    TResult Function()? waiting,
    TResult Function(dynamic error)? error,
  }) {
    return waiting?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? notAuthorized,
    TResult Function(TokenEntity tokenEntity)? authorized,
    TResult Function(String name)? checked,
    TResult Function()? waiting,
    TResult Function(dynamic error)? error,
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
    required TResult Function(_AuthStateWaiting value) waiting,
    required TResult Function(_AuthStateError value) error,
  }) {
    return waiting(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_AuthStateNotAuthorized value)? notAuthorized,
    TResult Function(_AuthStateAuthorized value)? authorized,
    TResult Function(_AuthStateChecked value)? checked,
    TResult Function(_AuthStateWaiting value)? waiting,
    TResult Function(_AuthStateError value)? error,
  }) {
    return waiting?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthStateNotAuthorized value)? notAuthorized,
    TResult Function(_AuthStateAuthorized value)? authorized,
    TResult Function(_AuthStateChecked value)? checked,
    TResult Function(_AuthStateWaiting value)? waiting,
    TResult Function(_AuthStateError value)? error,
    required TResult orElse(),
  }) {
    if (waiting != null) {
      return waiting(this);
    }
    return orElse();
  }
}

abstract class _AuthStateWaiting implements AuthState {
  factory _AuthStateWaiting() = _$_AuthStateWaiting;
}

/// @nodoc
abstract class _$$_AuthStateErrorCopyWith<$Res> {
  factory _$$_AuthStateErrorCopyWith(
          _$_AuthStateError value, $Res Function(_$_AuthStateError) then) =
      __$$_AuthStateErrorCopyWithImpl<$Res>;
  $Res call({dynamic error});
}

/// @nodoc
class __$$_AuthStateErrorCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res>
    implements _$$_AuthStateErrorCopyWith<$Res> {
  __$$_AuthStateErrorCopyWithImpl(
      _$_AuthStateError _value, $Res Function(_$_AuthStateError) _then)
      : super(_value, (v) => _then(v as _$_AuthStateError));

  @override
  _$_AuthStateError get _value => super._value as _$_AuthStateError;

  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$_AuthStateError(
      error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

class _$_AuthStateError implements _AuthStateError {
  _$_AuthStateError(this.error);

  @override
  final dynamic error;

  @override
  String toString() {
    return 'AuthState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuthStateError &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  _$$_AuthStateErrorCopyWith<_$_AuthStateError> get copyWith =>
      __$$_AuthStateErrorCopyWithImpl<_$_AuthStateError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() notAuthorized,
    required TResult Function(TokenEntity tokenEntity) authorized,
    required TResult Function(String name) checked,
    required TResult Function() waiting,
    required TResult Function(dynamic error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? notAuthorized,
    TResult Function(TokenEntity tokenEntity)? authorized,
    TResult Function(String name)? checked,
    TResult Function()? waiting,
    TResult Function(dynamic error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? notAuthorized,
    TResult Function(TokenEntity tokenEntity)? authorized,
    TResult Function(String name)? checked,
    TResult Function()? waiting,
    TResult Function(dynamic error)? error,
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
    required TResult Function(_AuthStateWaiting value) waiting,
    required TResult Function(_AuthStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_AuthStateNotAuthorized value)? notAuthorized,
    TResult Function(_AuthStateAuthorized value)? authorized,
    TResult Function(_AuthStateChecked value)? checked,
    TResult Function(_AuthStateWaiting value)? waiting,
    TResult Function(_AuthStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthStateNotAuthorized value)? notAuthorized,
    TResult Function(_AuthStateAuthorized value)? authorized,
    TResult Function(_AuthStateChecked value)? checked,
    TResult Function(_AuthStateWaiting value)? waiting,
    TResult Function(_AuthStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _AuthStateError implements AuthState {
  factory _AuthStateError(final dynamic error) = _$_AuthStateError;

  dynamic get error;
  @JsonKey(ignore: true)
  _$$_AuthStateErrorCopyWith<_$_AuthStateError> get copyWith =>
      throw _privateConstructorUsedError;
}
