import 'package:injectable/injectable.dart';

import '../../../app/data/dio_container.dart';
import '../domain/entities/user_profile/user_profile_entity.dart';
import '../domain/profile_repository.dart';
import 'dto/user_profile/user_profile_dto.dart';

@Injectable(as: ProfileRepository)
class NetworkProfileRepository implements ProfileRepository {
  final DioContainer dioContainer;

  NetworkProfileRepository(this.dioContainer);

  @override
  Future<UserProfileEntity> getProfile() async {
    await dioContainer.setHeaderLocale();
    try {
      final response = await dioContainer.dio.get(':6100/user');
      return UserProfileDto.fromJson(response.data['data']).toEntity();
    } catch (_) {
      rethrow;
    }
  }
}
