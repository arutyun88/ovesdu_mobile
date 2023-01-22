import 'package:domain/entity/location_entity/location_entity.dart';

abstract class LocationRepository {
  Future<List<LocationEntity>> getLocations(String query);

  Future<List<LocationEntity>> searchLocations(String query);

  Future<LocationEntity> saveLocation(String lat, String lon);
}
