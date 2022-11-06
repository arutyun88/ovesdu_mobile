import 'package:injectable/injectable.dart';
import 'package:ovesdu_mobile/feature/location/data/dto/location_dto.dart';

import '../../../app/data/dio_container.dart';
import '../domain/entities/location_entity/location_entity.dart';
import '../domain/location_repository.dart';

int count = 0;

@Injectable(as: LocationRepository)
@dev
class LocalLocationRepository implements LocationRepository {
  final DioContainer dioContainer;

  LocalLocationRepository(this.dioContainer);

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
