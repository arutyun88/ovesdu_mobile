import 'entities/location_entity/location_entity.dart';

abstract class LocationRepository {
  Future<List<LocationEntity>> getLocations(String query);

  Future<List<LocationEntity>> saveLocations(String query);
}
