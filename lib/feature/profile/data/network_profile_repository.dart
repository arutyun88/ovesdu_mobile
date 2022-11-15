import 'package:injectable/injectable.dart';

import '../../../app/domain/app_api.dart';
import '../domain/entities/user_profile/user_profile_entity.dart';
import '../domain/profile_repository.dart';
import 'dto/user_profile/user_profile_dto.dart';

@Injectable(as: ProfileRepository)
class NetworkProfileRepository implements ProfileRepository {
  final AppApi _api;

  NetworkProfileRepository(AppApi api) : _api = api;

  @override
  Future<UserProfileEntity> getProfile() async {
    await _api.setHeaderLocale();
    try {
      final response = await _api.getProfile();
      return UserProfileDto.fromJson(response.data['data']).toEntity();
    } catch (_) {
      rethrow;
    }
  }
}
