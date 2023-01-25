import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

import '../../../app/domain/app_api.dart';

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

  @override
  Future<UserSimpleFollowersEntity> getMyFollowersIds() async {
    await _api.setHeaderLocale();
    try {
      final response = await _api.getMyFollowersIds();

      final data = response.data['data'];

      final followersResult =
          (data['followers'] as List).map((e) => e as int).toList();

      final followingResult =
          (data['following'] as List).map((e) => e as int).toList();

      return UserSimpleFollowersEntity(followersResult, followingResult);
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<List<int>> getBlockedIds() async {
    await _api.setHeaderLocale();
    try {
      final response = await _api.getBlockedIds();

      final data = response.data['data'] as List;

      final result = data.map((e) => e as int).toList();

      return result;
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<int> createFollowing(String id) async {
    await _api.setHeaderLocale();
    try {
      final response = await _api.createFollowing(id);

      final data = response.data['data'] as int;

      return data;
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<int> deleteFollowing(String id) async {
    await _api.setHeaderLocale();
    try {
      final response = await _api.deleteFollowing(id);

      final data = response.data['data'] as int;

      return data;
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<int> addBlocked(String id) async {
    await _api.setHeaderLocale();
    try {
      final response = await _api.addBlocked(id);

      final data = response.data['data'] as int;

      return data;
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<int> removeBlocked(String id) async {
    await _api.setHeaderLocale();
    try {
      final response = await _api.removeBlocked(id);

      final data = response.data['data'] as int;

      return data;
    } catch (_) {
      rethrow;
    }
  }
}
