import 'entities/user_profile/user_profile_entity.dart';
import 'entities/user_profile_follower/user_profile_follower_entity.dart';
import 'entities/user_profile_statistic/user_profile_statistic_entity.dart';

abstract class ProfileRepository {
  Future<UserProfileEntity> getProfile();

  Future<UserProfileEntity> getUserProfile(String userId);

  Future<UserProfileStatisticEntity> getUserProfileStatistic(String userId);

  Future<List<UserProfileFollowerEntity>> getUserProfileFollowers(
    List<int> followers,
  );
}