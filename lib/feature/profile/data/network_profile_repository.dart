import 'package:injectable/injectable.dart';
import 'package:ovesdu_mobile/feature/profile/domain/entities/user_profile_statistic/user_profile_statistic_entity.dart';

import '../../../app/domain/app_api.dart';
import '../domain/entities/user_profile/user_profile_entity.dart';
import '../domain/entities/user_profile_follower/user_profile_follower_entity.dart';
import '../domain/profile_repository.dart';
import 'dto/user_profile/user_profile_dto.dart';
import 'dto/user_profile_follower/user_profile_follower_dto.dart';
import 'dto/user_profile_statistic/user_profile_statistic_dto.dart';

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

  @override
  Future<UserProfileEntity> getUserProfile(String userId) async {
    await _api.setHeaderLocale();
    try {
      final response = await _api.getUserProfile(userId);
      return UserProfileDto.fromJson(response.data['data']).toOtherEntity();
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<UserProfileStatisticEntity> getUserProfileStatistic(
    String userId,
  ) async {
    await _api.setHeaderLocale();
    try {
      final response = await _api.getUserProfileStatistic(userId);
      return UserProfileStatisticDto.fromJson(response.data['data']).toEntity();
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<List<UserProfileFollowerEntity>> getUserProfileFollowers(
    List<int> followers,
  ) async {
    await _api.setHeaderLocale();
    try {
      final response = await _api.getUserProfileFollowers(followers);

      return (response.data['data'] as List)
          .map(
            (follower) => UserProfileFollowerDto.fromJson(follower).toEntity(),
          )
          .toList();
    } catch (_) {
      rethrow;
    }
  }
}
