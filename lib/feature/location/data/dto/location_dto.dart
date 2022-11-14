import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/location_entity/location_entity.dart';

part 'location_dto.g.dart';

@JsonSerializable()
class LocationDto {
  final dynamic id;
  final dynamic country;
  final dynamic area;
  final dynamic city;
  final dynamic lat;
  final dynamic lon;
  final dynamic uuid;

  LocationDto({
    this.id,
    this.country,
    this.area,
    this.city,
    this.lat,
    this.lon,
    this.uuid,
  });

  factory LocationDto.fromJson(Map<String, dynamic> json) =>
      _$LocationDtoFromJson(json);

  Map<String, dynamic> toJson() => _$LocationDtoToJson(this);

  LocationEntity toEntity() => LocationEntity(
        id: id.toString(),
        country: country.toString(),
        area: area.toString(),
        city: city.toString(),
        lat: lat.toString(),
        lon: lon.toString(),
        uuid: uuid.toString(),
      );
}
