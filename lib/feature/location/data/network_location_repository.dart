import 'package:injectable/injectable.dart';

import '../../../app/domain/app_api.dart';
import '../domain/entities/location_entity/location_entity.dart';
import '../domain/location_repository.dart';
import 'dto/location_dto.dart';

@Injectable(as: LocationRepository)
class NetworkLocationRepository implements LocationRepository {
  final AppApi _api;

  NetworkLocationRepository(AppApi api) : _api = api;

  @override
  Future<List<LocationEntity>> getLocations(String query) async {
    await _api.setHeaderLocale();
    try {
      final response = await _api.getLocations(query);
      return (response.data['data'] as List)
          .map((location) => LocationDto.fromJson(location).toEntity())
          .toList();
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<List<LocationEntity>> searchLocations(String query) async {
    await _api.setHeaderLocale();
    try {
      final response = await _api.searchLocations(query);
      return (response.data['data'] as List)
          .map((location) => LocationDto.fromJson(location).toEntity())
          .toList();
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<LocationEntity> saveLocation(String lat, String lon) async {
    await _api.setHeaderLocale();
    try {
      final response = await _api.saveLocation({'lat': lat, 'lon': lon});
      return LocationDto.fromJson(response.data['data']).toEntity();
    } catch (_) {
      rethrow;
    }
  }
}
