import 'package:domain/domain.dart';
import 'package:domain/entity/location_entity/location_entity.dart';

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
