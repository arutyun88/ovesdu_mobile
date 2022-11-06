import 'package:injectable/injectable.dart';

import '../../../app/data/dio_container.dart';
import '../domain/location_repository.dart';

int count = 0;

@Injectable(as: LocationRepository)
@dev
class LocalLocationRepository implements LocationRepository {
  final DioContainer dioContainer;

  LocalLocationRepository(this.dioContainer);

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
