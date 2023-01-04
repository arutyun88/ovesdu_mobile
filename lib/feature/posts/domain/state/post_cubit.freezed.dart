// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'post_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PostState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() waiting,
    required TResult Function(PostsEntity postsEntity) received,
    required TResult Function(ErrorEntity error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? waiting,
    TResult? Function(PostsEntity postsEntity)? received,
    TResult? Function(ErrorEntity error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? waiting,
    TResult Function(PostsEntity postsEntity)? received,
    TResult Function(ErrorEntity error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PostStateInit value) init,
    required TResult Function(_PostStateWaiting value) waiting,
    required TResult Function(_PostStateReceived value) received,
    required TResult Function(_PostStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PostStateInit value)? init,
    TResult? Function(_PostStateWaiting value)? waiting,
    TResult? Function(_PostStateReceived value)? received,
    TResult? Function(_PostStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PostStateInit value)? init,
    TResult Function(_PostStateWaiting value)? waiting,
    TResult Function(_PostStateReceived value)? received,
    TResult Function(_PostStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostStateCopyWith<$Res> {
  factory $PostStateCopyWith(PostState value, $Res Function(PostState) then) =
      _$PostStateCopyWithImpl<$Res, PostState>;
}

/// @nodoc
class _$PostStateCopyWithImpl<$Res, $Val extends PostState>
    implements $PostStateCopyWith<$Res> {
  _$PostStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_PostStateInitCopyWith<$Res> {
  factory _$$_PostStateInitCopyWith(
          _$_PostStateInit value, $Res Function(_$_PostStateInit) then) =
      __$$_PostStateInitCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_PostStateInitCopyWithImpl<$Res>
    extends _$PostStateCopyWithImpl<$Res, _$_PostStateInit>
    implements _$$_PostStateInitCopyWith<$Res> {
  __$$_PostStateInitCopyWithImpl(
      _$_PostStateInit _value, $Res Function(_$_PostStateInit) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_PostStateInit implements _PostStateInit {
  _$_PostStateInit();

  @override
  String toString() {
    return 'PostState.init()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_PostStateInit);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() waiting,
    required TResult Function(PostsEntity postsEntity) received,
    required TResult Function(ErrorEntity error) error,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? waiting,
    TResult? Function(PostsEntity postsEntity)? received,
    TResult? Function(ErrorEntity error)? error,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? waiting,
    TResult Function(PostsEntity postsEntity)? received,
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
    required TResult Function(_PostStateInit value) init,
    required TResult Function(_PostStateWaiting value) waiting,
    required TResult Function(_PostStateReceived value) received,
    required TResult Function(_PostStateError value) error,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PostStateInit value)? init,
    TResult? Function(_PostStateWaiting value)? waiting,
    TResult? Function(_PostStateReceived value)? received,
    TResult? Function(_PostStateError value)? error,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PostStateInit value)? init,
    TResult Function(_PostStateWaiting value)? waiting,
    TResult Function(_PostStateReceived value)? received,
    TResult Function(_PostStateError value)? error,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class _PostStateInit implements PostState {
  factory _PostStateInit() = _$_PostStateInit;
}

/// @nodoc
abstract class _$$_PostStateWaitingCopyWith<$Res> {
  factory _$$_PostStateWaitingCopyWith(
          _$_PostStateWaiting value, $Res Function(_$_PostStateWaiting) then) =
      __$$_PostStateWaitingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_PostStateWaitingCopyWithImpl<$Res>
    extends _$PostStateCopyWithImpl<$Res, _$_PostStateWaiting>
    implements _$$_PostStateWaitingCopyWith<$Res> {
  __$$_PostStateWaitingCopyWithImpl(
      _$_PostStateWaiting _value, $Res Function(_$_PostStateWaiting) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_PostStateWaiting implements _PostStateWaiting {
  _$_PostStateWaiting();

  @override
  String toString() {
    return 'PostState.waiting()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_PostStateWaiting);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() waiting,
    required TResult Function(PostsEntity postsEntity) received,
    required TResult Function(ErrorEntity error) error,
  }) {
    return waiting();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? waiting,
    TResult? Function(PostsEntity postsEntity)? received,
    TResult? Function(ErrorEntity error)? error,
  }) {
    return waiting?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? waiting,
    TResult Function(PostsEntity postsEntity)? received,
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
    required TResult Function(_PostStateInit value) init,
    required TResult Function(_PostStateWaiting value) waiting,
    required TResult Function(_PostStateReceived value) received,
    required TResult Function(_PostStateError value) error,
  }) {
    return waiting(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PostStateInit value)? init,
    TResult? Function(_PostStateWaiting value)? waiting,
    TResult? Function(_PostStateReceived value)? received,
    TResult? Function(_PostStateError value)? error,
  }) {
    return waiting?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PostStateInit value)? init,
    TResult Function(_PostStateWaiting value)? waiting,
    TResult Function(_PostStateReceived value)? received,
    TResult Function(_PostStateError value)? error,
    required TResult orElse(),
  }) {
    if (waiting != null) {
      return waiting(this);
    }
    return orElse();
  }
}

abstract class _PostStateWaiting implements PostState {
  factory _PostStateWaiting() = _$_PostStateWaiting;
}

/// @nodoc
abstract class _$$_PostStateReceivedCopyWith<$Res> {
  factory _$$_PostStateReceivedCopyWith(_$_PostStateReceived value,
          $Res Function(_$_PostStateReceived) then) =
      __$$_PostStateReceivedCopyWithImpl<$Res>;
  @useResult
  $Res call({PostsEntity postsEntity});

  $PostsEntityCopyWith<$Res> get postsEntity;
}

/// @nodoc
class __$$_PostStateReceivedCopyWithImpl<$Res>
    extends _$PostStateCopyWithImpl<$Res, _$_PostStateReceived>
    implements _$$_PostStateReceivedCopyWith<$Res> {
  __$$_PostStateReceivedCopyWithImpl(
      _$_PostStateReceived _value, $Res Function(_$_PostStateReceived) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? postsEntity = null,
  }) {
    return _then(_$_PostStateReceived(
      null == postsEntity
          ? _value.postsEntity
          : postsEntity // ignore: cast_nullable_to_non_nullable
              as PostsEntity,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $PostsEntityCopyWith<$Res> get postsEntity {
    return $PostsEntityCopyWith<$Res>(_value.postsEntity, (value) {
      return _then(_value.copyWith(postsEntity: value));
    });
  }
}

/// @nodoc

class _$_PostStateReceived implements _PostStateReceived {
  _$_PostStateReceived(this.postsEntity);

  @override
  final PostsEntity postsEntity;

  @override
  String toString() {
    return 'PostState.received(postsEntity: $postsEntity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PostStateReceived &&
            (identical(other.postsEntity, postsEntity) ||
                other.postsEntity == postsEntity));
  }

  @override
  int get hashCode => Object.hash(runtimeType, postsEntity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PostStateReceivedCopyWith<_$_PostStateReceived> get copyWith =>
      __$$_PostStateReceivedCopyWithImpl<_$_PostStateReceived>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() waiting,
    required TResult Function(PostsEntity postsEntity) received,
    required TResult Function(ErrorEntity error) error,
  }) {
    return received(postsEntity);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? waiting,
    TResult? Function(PostsEntity postsEntity)? received,
    TResult? Function(ErrorEntity error)? error,
  }) {
    return received?.call(postsEntity);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? waiting,
    TResult Function(PostsEntity postsEntity)? received,
    TResult Function(ErrorEntity error)? error,
    required TResult orElse(),
  }) {
    if (received != null) {
      return received(postsEntity);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PostStateInit value) init,
    required TResult Function(_PostStateWaiting value) waiting,
    required TResult Function(_PostStateReceived value) received,
    required TResult Function(_PostStateError value) error,
  }) {
    return received(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PostStateInit value)? init,
    TResult? Function(_PostStateWaiting value)? waiting,
    TResult? Function(_PostStateReceived value)? received,
    TResult? Function(_PostStateError value)? error,
  }) {
    return received?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PostStateInit value)? init,
    TResult Function(_PostStateWaiting value)? waiting,
    TResult Function(_PostStateReceived value)? received,
    TResult Function(_PostStateError value)? error,
    required TResult orElse(),
  }) {
    if (received != null) {
      return received(this);
    }
    return orElse();
  }
}

abstract class _PostStateReceived implements PostState {
  factory _PostStateReceived(final PostsEntity postsEntity) =
      _$_PostStateReceived;

  PostsEntity get postsEntity;
  @JsonKey(ignore: true)
  _$$_PostStateReceivedCopyWith<_$_PostStateReceived> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_PostStateErrorCopyWith<$Res> {
  factory _$$_PostStateErrorCopyWith(
          _$_PostStateError value, $Res Function(_$_PostStateError) then) =
      __$$_PostStateErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({ErrorEntity error});

  $ErrorEntityCopyWith<$Res> get error;
}

/// @nodoc
class __$$_PostStateErrorCopyWithImpl<$Res>
    extends _$PostStateCopyWithImpl<$Res, _$_PostStateError>
    implements _$$_PostStateErrorCopyWith<$Res> {
  __$$_PostStateErrorCopyWithImpl(
      _$_PostStateError _value, $Res Function(_$_PostStateError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$_PostStateError(
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

class _$_PostStateError implements _PostStateError {
  _$_PostStateError(this.error);

  @override
  final ErrorEntity error;

  @override
  String toString() {
    return 'PostState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PostStateError &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PostStateErrorCopyWith<_$_PostStateError> get copyWith =>
      __$$_PostStateErrorCopyWithImpl<_$_PostStateError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() waiting,
    required TResult Function(PostsEntity postsEntity) received,
    required TResult Function(ErrorEntity error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? waiting,
    TResult? Function(PostsEntity postsEntity)? received,
    TResult? Function(ErrorEntity error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? waiting,
    TResult Function(PostsEntity postsEntity)? received,
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
    required TResult Function(_PostStateInit value) init,
    required TResult Function(_PostStateWaiting value) waiting,
    required TResult Function(_PostStateReceived value) received,
    required TResult Function(_PostStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PostStateInit value)? init,
    TResult? Function(_PostStateWaiting value)? waiting,
    TResult? Function(_PostStateReceived value)? received,
    TResult? Function(_PostStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PostStateInit value)? init,
    TResult Function(_PostStateWaiting value)? waiting,
    TResult Function(_PostStateReceived value)? received,
    TResult Function(_PostStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _PostStateError implements PostState {
  factory _PostStateError(final ErrorEntity error) = _$_PostStateError;

  ErrorEntity get error;
  @JsonKey(ignore: true)
  _$$_PostStateErrorCopyWith<_$_PostStateError> get copyWith =>
      throw _privateConstructorUsedError;
}
