import 'package:ovesdu_mobile/feature/location/domain/entities/location_entity/location_entity.dart';

abstract class LocationRepository {
  Future<List<LocationEntity>> getLocations(String query);
}