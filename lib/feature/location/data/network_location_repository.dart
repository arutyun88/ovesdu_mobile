import 'package:injectable/injectable.dart';

import '../../../app/data/dio_container.dart';
import '../domain/location_repository.dart';

@Injectable(as: LocationRepository)
@prod
class NetworkLocationRepository implements LocationRepository {
  final DioContainer dioContainer;

  NetworkLocationRepository(this.dioContainer);

  @override
  Future getLocation(String query) async {
    await dioContainer.setHeaderLocale();

    try {
      final response = await dioContainer.dio.post(
        '/auth/location',
        data: {
          'query': query,
        },
      );
      return response.data['data'];
    } catch (_) {
      rethrow;
    }
  }
}
