// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ErrorEntity _$$_ErrorEntityFromJson(Map<String, dynamic> json) =>
    _$_ErrorEntity(
      message: json['message'] as String,
      errorMessage: json['errorMessage'] as String?,
      error: json['error'],
    );

Map<String, dynamic> _$$_ErrorEntityToJson(_$_ErrorEntity instance) =>
    <String, dynamic>{
      'message': instance.message,
      'errorMessage': instance.errorMessage,
      'error': instance.error,
    };
