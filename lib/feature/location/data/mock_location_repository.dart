import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../domain/location_repository.dart';

@Injectable(as: LocationRepository)
@test
class MockLocationRepository implements LocationRepository {
  @override
  Future getLocation(String query) async {
    try {
      final split = query.split('count: ');
      final count = split.length > 1 ? (split[1]).trim() : '';

      final response = await Future.delayed(const Duration(seconds: 2)).then(
        (value) => Response<dynamic>(
          data: {
            "data": query.contains('some')
                ? 'Some country, some city, count: $count'
                : 'unknown city',
          },
          requestOptions: RequestOptions(path: ''),
        ),
      );
      return response.data['data'];
    } catch (_) {
      rethrow;
    }
  }
}
