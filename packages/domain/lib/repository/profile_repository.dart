import 'package:domain/domain.dart';


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
