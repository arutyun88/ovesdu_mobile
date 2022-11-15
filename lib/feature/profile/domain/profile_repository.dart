import 'entities/user_profile/user_profile_entity.dart';

abstract class ProfileRepository {
  Future<UserProfileEntity> getProfile();
}
