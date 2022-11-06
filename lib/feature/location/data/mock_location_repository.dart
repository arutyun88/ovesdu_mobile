import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../domain/entities/location_entity/location_entity.dart';
import '../domain/location_repository.dart';
import 'dto/location_dto.dart';

@Injectable(as: LocationRepository)
@test
class MockLocationRepository implements LocationRepository {
  @override
  Future<List<LocationEntity>> getLocations(String query) async {
    try {
      var values = _cities.map((e) => LocationDto.fromJson(e)).toList();
      var result = values
          .where((element) => _check(element, query))
          .map((e) => e.toJson())
          .toList();

      var response =
          await Future.delayed(const Duration(seconds: 1)).then((value) {
        return Response<dynamic>(
          data: {
            "data": result,
          },
          requestOptions: RequestOptions(path: ''),
        );
      });
      return (response.data['data'] as List)
          .map((location) => LocationDto.fromJson(location).toEntity())
          .toList();
    } catch (_) {
      rethrow;
    }
  }

  bool _check(LocationDto element, String query) =>
      _checkValue(element.country, query) ||
      _checkValue(element.city, query) ||
      _checkValue(element.area, query);

  bool _checkValue(dynamic value, String query) =>
      (value as String).toLowerCase().contains(query.toLowerCase());
}

final _cities = [
  {
    "id": 1,
    "country": 'Russia',
    "area": 'Belgorod state',
    "city": 'Stary Oskol',
  },
  {
    "id": 2,
    "country": 'Russia',
    "area": 'Voronezh state',
    "city": 'Voronezh',
  },
  {
    "id": 3,
    "country": 'Armenia',
    "area": 'Tavush region',
    "city": 'Noyemberyan',
  },
  {
    "id": 4,
    "country": 'Armenia',
    "area": 'Tavush region',
    "city": 'Voskepar',
  },
  {
    "id": 5,
    "country": 'Armenia',
    "area": 'Tavush region',
    "city": 'Ijevan',
  },
  {
    "id": 6,
    "country": 'Armenia',
    "area": '',
    "city": 'Yerevan',
  },
];
