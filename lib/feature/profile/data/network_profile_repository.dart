import 'package:injectable/injectable.dart';

import '../../../app/domain/app_api.dart';
import '../domain/entities/user_profile/user_profile_entity.dart';
import '../domain/entities/user_profile_follower/user_profile_followers_entity.dart';
import '../domain/entities/user_profile_statistic/user_profile_statistic_entity.dart';
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
  Future<UserProfileFollowersEntity> getUserProfileFollowers(
    List<int> followers,
    List<int> following,
  ) async {
    await _api.setHeaderLocale();
    try {
      final response = await _api.getUserProfileFollowers(
        {'followers': followers, 'following': following},
      );

      final data = response.data['data'];

      final followersResult = (data['followers'] as List)
          .map(
            (follower) => UserProfileFollowerDto.fromJson(follower).toEntity(),
          )
          .toList();

      final followingResult = (data['following'] as List)
          .map(
            (follower) => UserProfileFollowerDto.fromJson(follower).toEntity(),
          )
          .toList();

      return UserProfileFollowersEntity(followersResult, followingResult);
    } catch (_) {
      rethrow;
    }
  }
}
