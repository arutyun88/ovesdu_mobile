// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocationDto _$LocationDtoFromJson(Map<String, dynamic> json) => LocationDto(
      id: json['id'],
      country: json['country'],
      area: json['area'],
      city: json['city'],
      lat: json['lat'],
      lon: json['lon'],
    );

Map<String, dynamic> _$LocationDtoToJson(LocationDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'country': instance.country,
      'area': instance.area,
      'city': instance.city,
      'lat': instance.lat,
      'lon': instance.lon,
    };
