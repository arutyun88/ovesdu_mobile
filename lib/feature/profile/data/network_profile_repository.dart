import 'package:injectable/injectable.dart';
import 'package:ovesdu_mobile/feature/location/domain/entities/location_entity/location_entity.dart';
import 'package:ovesdu_mobile/feature/profile/domain/profile_repository.dart';

import '../../../app/data/dio_container.dart';
import '../../../app/domain/entities/user_entity/user_entity.dart';
import '../../auth/data/dto/user_dto.dart';

@Injectable(as: ProfileRepository)
class NetworkProfileRepository implements ProfileRepository {
  final DioContainer dioContainer;

  NetworkProfileRepository(this.dioContainer);

  @override
  Future<UserEntity> getProfile() async {
    await dioContainer.setHeaderLocale();
    try {
      final response = await dioContainer.dio.get('/auth/user');
      return UserDto.fromJson(response.data['data']).toEntity(
        LocationEntity(
          id: '1',
          country: 'russia',
          area: 'belgorod',
          city: 'oskol',
        ),
      );
    } catch (_) {
      rethrow;
    }
  }
}
