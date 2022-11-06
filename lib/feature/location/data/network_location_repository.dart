import 'package:injectable/injectable.dart';

import '../../../app/data/dio_container.dart';
import '../domain/entities/location_entity/location_entity.dart';
import '../domain/location_repository.dart';
import 'dto/location_dto.dart';

@Injectable(as: LocationRepository)
@prod
class NetworkLocationRepository implements LocationRepository {
  final DioContainer dioContainer;

  NetworkLocationRepository(this.dioContainer);

  @override
  Future<List<LocationEntity>> getLocations(String query) async {
    await dioContainer.setHeaderLocale();

    try {
      final response = await dioContainer.dio.get('/library/location/$query');
      return (response.data['data'] as List)
          .map((location) => LocationDto.fromJson(location).toEntity())
          .toList();
    } catch (_) {
      rethrow;
    }
  }
}
