import 'entities/user_profile/user_profile_entity.dart';
import 'entities/user_profile_follower/user_profile_followers_entity.dart';
import 'entities/user_profile_follower/user_simple_followers_entity.dart';
import 'entities/user_profile_statistic/user_profile_statistic_entity.dart';

abstract class ProfileRepository {
  Future<UserProfileEntity> getProfile();

  Future<UserProfileEntity> getUserProfile(String userId);

  Future<UserProfileStatisticEntity> getUserProfileStatistic(String userId);

  Future<UserProfileFollowersEntity> getUserProfileFollowers(
    List<int> followers,
    List<int> following,
  );

  Future<UserSimpleFollowersEntity> getMyFollowersIds();

  Future<List<int>> getBlockedIds();

  Future<int> createFollowing(String id);

  Future<int> deleteFollowing(String id);

  Future<int> addBlocked(String id);

  Future<int> removeBlocked(String id);
}
