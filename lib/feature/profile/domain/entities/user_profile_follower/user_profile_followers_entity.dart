import 'user_profile_follower_item_entity.dart';

class UserProfileFollowersEntity {
  final List<UserProfileFollowerItemEntity> followers;
  final List<UserProfileFollowerItemEntity> following;

  UserProfileFollowersEntity(this.followers, this.following);
}
