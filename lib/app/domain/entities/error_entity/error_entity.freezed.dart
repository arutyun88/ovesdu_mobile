// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'error_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ErrorEntity _$ErrorEntityFromJson(Map<String, dynamic> json) {
  return _ErrorEntity.fromJson(json);
}

/// @nodoc
mixin _$ErrorEntity {
  String get message => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  dynamic get error => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ErrorEntityCopyWith<ErrorEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ErrorEntityCopyWith<$Res> {
  factory $ErrorEntityCopyWith(
          ErrorEntity value, $Res Function(ErrorEntity) then) =
      _$ErrorEntityCopyWithImpl<$Res, ErrorEntity>;
  @useResult
  $Res call({String message, String? errorMessage, dynamic error});
}

/// @nodoc
class _$ErrorEntityCopyWithImpl<$Res, $Val extends ErrorEntity>
    implements $ErrorEntityCopyWith<$Res> {
  _$ErrorEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? errorMessage = freezed,
    Object? error = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ErrorEntityCopyWith<$Res>
    implements $ErrorEntityCopyWith<$Res> {
  factory _$$_ErrorEntityCopyWith(
          _$_ErrorEntity value, $Res Function(_$_ErrorEntity) then) =
      __$$_ErrorEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, String? errorMessage, dynamic error});
}

/// @nodoc
class __$$_ErrorEntityCopyWithImpl<$Res>
    extends _$ErrorEntityCopyWithImpl<$Res, _$_ErrorEntity>
    implements _$$_ErrorEntityCopyWith<$Res> {
  __$$_ErrorEntityCopyWithImpl(
      _$_ErrorEntity _value, $Res Function(_$_ErrorEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? errorMessage = freezed,
    Object? error = null,
  }) {
    return _then(_$_ErrorEntity(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ErrorEntity implements _ErrorEntity {
  const _$_ErrorEntity({required this.message, this.errorMessage, this.error});

  factory _$_ErrorEntity.fromJson(Map<String, dynamic> json) =>
      _$$_ErrorEntityFromJson(json);

  @override
  final String message;
  @override
  final String? errorMessage;
  @override
  final dynamic error;

  @override
  String toString() {
    return 'ErrorEntity(message: $message, errorMessage: $errorMessage, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ErrorEntity &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, message, errorMessage,
      const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ErrorEntityCopyWith<_$_ErrorEntity> get copyWith =>
      __$$_ErrorEntityCopyWithImpl<_$_ErrorEntity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ErrorEntityToJson(
      this,
    );
  }
}

abstract class _ErrorEntity implements ErrorEntity {
  const factory _ErrorEntity(
      {required final String message,
      final String? errorMessage,
      final dynamic error}) = _$_ErrorEntity;

  factory _ErrorEntity.fromJson(Map<String, dynamic> json) =
      _$_ErrorEntity.fromJson;

  @override
  String get message;
  @override
  String? get errorMessage;
  @override
  dynamic get error;
  @override
  @JsonKey(ignore: true)
  _$$_ErrorEntityCopyWith<_$_ErrorEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
