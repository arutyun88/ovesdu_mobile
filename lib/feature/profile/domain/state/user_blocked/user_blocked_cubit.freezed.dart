// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_blocked_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UserBlockedState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() waiting,
    required TResult Function(List<int> blocked) received,
    required TResult Function(ErrorEntity error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? waiting,
    TResult? Function(List<int> blocked)? received,
    TResult? Function(ErrorEntity error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? waiting,
    TResult Function(List<int> blocked)? received,
    TResult Function(ErrorEntity error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UserBlockedStateInit value) init,
    required TResult Function(_UserBlockedStateWaiting value) waiting,
    required TResult Function(_UserBlockedStateReceived value) received,
    required TResult Function(_UserBlockedStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UserBlockedStateInit value)? init,
    TResult? Function(_UserBlockedStateWaiting value)? waiting,
    TResult? Function(_UserBlockedStateReceived value)? received,
    TResult? Function(_UserBlockedStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UserBlockedStateInit value)? init,
    TResult Function(_UserBlockedStateWaiting value)? waiting,
    TResult Function(_UserBlockedStateReceived value)? received,
    TResult Function(_UserBlockedStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserBlockedStateCopyWith<$Res> {
  factory $UserBlockedStateCopyWith(
          UserBlockedState value, $Res Function(UserBlockedState) then) =
      _$UserBlockedStateCopyWithImpl<$Res, UserBlockedState>;
}

/// @nodoc
class _$UserBlockedStateCopyWithImpl<$Res, $Val extends UserBlockedState>
    implements $UserBlockedStateCopyWith<$Res> {
  _$UserBlockedStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_UserBlockedStateInitCopyWith<$Res> {
  factory _$$_UserBlockedStateInitCopyWith(_$_UserBlockedStateInit value,
          $Res Function(_$_UserBlockedStateInit) then) =
      __$$_UserBlockedStateInitCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_UserBlockedStateInitCopyWithImpl<$Res>
    extends _$UserBlockedStateCopyWithImpl<$Res, _$_UserBlockedStateInit>
    implements _$$_UserBlockedStateInitCopyWith<$Res> {
  __$$_UserBlockedStateInitCopyWithImpl(_$_UserBlockedStateInit _value,
      $Res Function(_$_UserBlockedStateInit) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_UserBlockedStateInit implements _UserBlockedStateInit {
  _$_UserBlockedStateInit();

  @override
  String toString() {
    return 'UserBlockedState.init()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_UserBlockedStateInit);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() waiting,
    required TResult Function(List<int> blocked) received,
    required TResult Function(ErrorEntity error) error,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? waiting,
    TResult? Function(List<int> blocked)? received,
    TResult? Function(ErrorEntity error)? error,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? waiting,
    TResult Function(List<int> blocked)? received,
    TResult Function(ErrorEntity error)? error,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UserBlockedStateInit value) init,
    required TResult Function(_UserBlockedStateWaiting value) waiting,
    required TResult Function(_UserBlockedStateReceived value) received,
    required TResult Function(_UserBlockedStateError value) error,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UserBlockedStateInit value)? init,
    TResult? Function(_UserBlockedStateWaiting value)? waiting,
    TResult? Function(_UserBlockedStateReceived value)? received,
    TResult? Function(_UserBlockedStateError value)? error,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UserBlockedStateInit value)? init,
    TResult Function(_UserBlockedStateWaiting value)? waiting,
    TResult Function(_UserBlockedStateReceived value)? received,
    TResult Function(_UserBlockedStateError value)? error,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class _UserBlockedStateInit implements UserBlockedState {
  factory _UserBlockedStateInit() = _$_UserBlockedStateInit;
}

/// @nodoc
abstract class _$$_UserBlockedStateWaitingCopyWith<$Res> {
  factory _$$_UserBlockedStateWaitingCopyWith(_$_UserBlockedStateWaiting value,
          $Res Function(_$_UserBlockedStateWaiting) then) =
      __$$_UserBlockedStateWaitingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_UserBlockedStateWaitingCopyWithImpl<$Res>
    extends _$UserBlockedStateCopyWithImpl<$Res, _$_UserBlockedStateWaiting>
    implements _$$_UserBlockedStateWaitingCopyWith<$Res> {
  __$$_UserBlockedStateWaitingCopyWithImpl(_$_UserBlockedStateWaiting _value,
      $Res Function(_$_UserBlockedStateWaiting) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_UserBlockedStateWaiting implements _UserBlockedStateWaiting {
  _$_UserBlockedStateWaiting();

  @override
  String toString() {
    return 'UserBlockedState.waiting()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserBlockedStateWaiting);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() waiting,
    required TResult Function(List<int> blocked) received,
    required TResult Function(ErrorEntity error) error,
  }) {
    return waiting();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? waiting,
    TResult? Function(List<int> blocked)? received,
    TResult? Function(ErrorEntity error)? error,
  }) {
    return waiting?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? waiting,
    TResult Function(List<int> blocked)? received,
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
    required TResult Function(_UserBlockedStateInit value) init,
    required TResult Function(_UserBlockedStateWaiting value) waiting,
    required TResult Function(_UserBlockedStateReceived value) received,
    required TResult Function(_UserBlockedStateError value) error,
  }) {
    return waiting(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UserBlockedStateInit value)? init,
    TResult? Function(_UserBlockedStateWaiting value)? waiting,
    TResult? Function(_UserBlockedStateReceived value)? received,
    TResult? Function(_UserBlockedStateError value)? error,
  }) {
    return waiting?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UserBlockedStateInit value)? init,
    TResult Function(_UserBlockedStateWaiting value)? waiting,
    TResult Function(_UserBlockedStateReceived value)? received,
    TResult Function(_UserBlockedStateError value)? error,
    required TResult orElse(),
  }) {
    if (waiting != null) {
      return waiting(this);
    }
    return orElse();
  }
}

abstract class _UserBlockedStateWaiting implements UserBlockedState {
  factory _UserBlockedStateWaiting() = _$_UserBlockedStateWaiting;
}

/// @nodoc
abstract class _$$_UserBlockedStateReceivedCopyWith<$Res> {
  factory _$$_UserBlockedStateReceivedCopyWith(
          _$_UserBlockedStateReceived value,
          $Res Function(_$_UserBlockedStateReceived) then) =
      __$$_UserBlockedStateReceivedCopyWithImpl<$Res>;
  @useResult
  $Res call({List<int> blocked});
}

/// @nodoc
class __$$_UserBlockedStateReceivedCopyWithImpl<$Res>
    extends _$UserBlockedStateCopyWithImpl<$Res, _$_UserBlockedStateReceived>
    implements _$$_UserBlockedStateReceivedCopyWith<$Res> {
  __$$_UserBlockedStateReceivedCopyWithImpl(_$_UserBlockedStateReceived _value,
      $Res Function(_$_UserBlockedStateReceived) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? blocked = null,
  }) {
    return _then(_$_UserBlockedStateReceived(
      null == blocked
          ? _value._blocked
          : blocked // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// @nodoc

class _$_UserBlockedStateReceived implements _UserBlockedStateReceived {
  _$_UserBlockedStateReceived(final List<int> blocked) : _blocked = blocked;

  final List<int> _blocked;
  @override
  List<int> get blocked {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_blocked);
  }

  @override
  String toString() {
    return 'UserBlockedState.received(blocked: $blocked)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserBlockedStateReceived &&
            const DeepCollectionEquality().equals(other._blocked, _blocked));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_blocked));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserBlockedStateReceivedCopyWith<_$_UserBlockedStateReceived>
      get copyWith => __$$_UserBlockedStateReceivedCopyWithImpl<
          _$_UserBlockedStateReceived>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() waiting,
    required TResult Function(List<int> blocked) received,
    required TResult Function(ErrorEntity error) error,
  }) {
    return received(blocked);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? waiting,
    TResult? Function(List<int> blocked)? received,
    TResult? Function(ErrorEntity error)? error,
  }) {
    return received?.call(blocked);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? waiting,
    TResult Function(List<int> blocked)? received,
    TResult Function(ErrorEntity error)? error,
    required TResult orElse(),
  }) {
    if (received != null) {
      return received(blocked);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UserBlockedStateInit value) init,
    required TResult Function(_UserBlockedStateWaiting value) waiting,
    required TResult Function(_UserBlockedStateReceived value) received,
    required TResult Function(_UserBlockedStateError value) error,
  }) {
    return received(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UserBlockedStateInit value)? init,
    TResult? Function(_UserBlockedStateWaiting value)? waiting,
    TResult? Function(_UserBlockedStateReceived value)? received,
    TResult? Function(_UserBlockedStateError value)? error,
  }) {
    return received?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UserBlockedStateInit value)? init,
    TResult Function(_UserBlockedStateWaiting value)? waiting,
    TResult Function(_UserBlockedStateReceived value)? received,
    TResult Function(_UserBlockedStateError value)? error,
    required TResult orElse(),
  }) {
    if (received != null) {
      return received(this);
    }
    return orElse();
  }
}

abstract class _UserBlockedStateReceived implements UserBlockedState {
  factory _UserBlockedStateReceived(final List<int> blocked) =
      _$_UserBlockedStateReceived;

  List<int> get blocked;
  @JsonKey(ignore: true)
  _$$_UserBlockedStateReceivedCopyWith<_$_UserBlockedStateReceived>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_UserBlockedStateErrorCopyWith<$Res> {
  factory _$$_UserBlockedStateErrorCopyWith(_$_UserBlockedStateError value,
          $Res Function(_$_UserBlockedStateError) then) =
      __$$_UserBlockedStateErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({ErrorEntity error});

  $ErrorEntityCopyWith<$Res> get error;
}

/// @nodoc
class __$$_UserBlockedStateErrorCopyWithImpl<$Res>
    extends _$UserBlockedStateCopyWithImpl<$Res, _$_UserBlockedStateError>
    implements _$$_UserBlockedStateErrorCopyWith<$Res> {
  __$$_UserBlockedStateErrorCopyWithImpl(_$_UserBlockedStateError _value,
      $Res Function(_$_UserBlockedStateError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$_UserBlockedStateError(
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

class _$_UserBlockedStateError implements _UserBlockedStateError {
  _$_UserBlockedStateError(this.error);

  @override
  final ErrorEntity error;

  @override
  String toString() {
    return 'UserBlockedState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserBlockedStateError &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserBlockedStateErrorCopyWith<_$_UserBlockedStateError> get copyWith =>
      __$$_UserBlockedStateErrorCopyWithImpl<_$_UserBlockedStateError>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() waiting,
    required TResult Function(List<int> blocked) received,
    required TResult Function(ErrorEntity error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? waiting,
    TResult? Function(List<int> blocked)? received,
    TResult? Function(ErrorEntity error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? waiting,
    TResult Function(List<int> blocked)? received,
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
    required TResult Function(_UserBlockedStateInit value) init,
    required TResult Function(_UserBlockedStateWaiting value) waiting,
    required TResult Function(_UserBlockedStateReceived value) received,
    required TResult Function(_UserBlockedStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UserBlockedStateInit value)? init,
    TResult? Function(_UserBlockedStateWaiting value)? waiting,
    TResult? Function(_UserBlockedStateReceived value)? received,
    TResult? Function(_UserBlockedStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UserBlockedStateInit value)? init,
    TResult Function(_UserBlockedStateWaiting value)? waiting,
    TResult Function(_UserBlockedStateReceived value)? received,
    TResult Function(_UserBlockedStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _UserBlockedStateError implements UserBlockedState {
  factory _UserBlockedStateError(final ErrorEntity error) =
      _$_UserBlockedStateError;

  ErrorEntity get error;
  @JsonKey(ignore: true)
  _$$_UserBlockedStateErrorCopyWith<_$_UserBlockedStateError> get copyWith =>
      throw _privateConstructorUsedError;
}
