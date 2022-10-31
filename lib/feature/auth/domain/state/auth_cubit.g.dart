// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_cubit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AuthStateNotAuthorized _$$_AuthStateNotAuthorizedFromJson(
        Map<String, dynamic> json) =>
    _$_AuthStateNotAuthorized(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$_AuthStateNotAuthorizedToJson(
        _$_AuthStateNotAuthorized instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$_AuthStateAuthorized _$$_AuthStateAuthorizedFromJson(
        Map<String, dynamic> json) =>
    _$_AuthStateAuthorized(
      TokenEntity.fromJson(json['tokenEntity'] as Map<String, dynamic>),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$_AuthStateAuthorizedToJson(
        _$_AuthStateAuthorized instance) =>
    <String, dynamic>{
      'tokenEntity': instance.tokenEntity,
      'runtimeType': instance.$type,
    };

_$_AuthStateChecked _$$_AuthStateCheckedFromJson(Map<String, dynamic> json) =>
    _$_AuthStateChecked(
      json['name'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$_AuthStateCheckedToJson(_$_AuthStateChecked instance) =>
    <String, dynamic>{
      'name': instance.name,
      'runtimeType': instance.$type,
    };

_$_AuthStateUsernameChecked _$$_AuthStateUsernameCheckedFromJson(
        Map<String, dynamic> json) =>
    _$_AuthStateUsernameChecked(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$_AuthStateUsernameCheckedToJson(
        _$_AuthStateUsernameChecked instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$_AuthStateContactChecked _$$_AuthStateContactCheckedFromJson(
        Map<String, dynamic> json) =>
    _$_AuthStateContactChecked(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$_AuthStateContactCheckedToJson(
        _$_AuthStateContactChecked instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$_AuthStateWaiting _$$_AuthStateWaitingFromJson(Map<String, dynamic> json) =>
    _$_AuthStateWaiting(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$_AuthStateWaitingToJson(_$_AuthStateWaiting instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$_AuthStateError _$$_AuthStateErrorFromJson(Map<String, dynamic> json) =>
    _$_AuthStateError(
      ErrorEntity.fromJson(json['error'] as Map<String, dynamic>),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$_AuthStateErrorToJson(_$_AuthStateError instance) =>
    <String, dynamic>{
      'error': instance.error,
      'runtimeType': instance.$type,
    };
