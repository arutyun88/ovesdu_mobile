// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LocationEntity _$$_LocationEntityFromJson(Map<String, dynamic> json) =>
    _$_LocationEntity(
      id: json['id'] as String,
      country: json['country'] as String,
      area: json['area'] as String,
      city: json['city'] as String,
      lat: json['lat'] as String?,
      lon: json['lon'] as String?,
      uuid: json['uuid'] as String?,
    );

Map<String, dynamic> _$$_LocationEntityToJson(_$_LocationEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'country': instance.country,
      'area': instance.area,
      'city': instance.city,
      'lat': instance.lat,
      'lon': instance.lon,
      'uuid': instance.uuid,
    };
