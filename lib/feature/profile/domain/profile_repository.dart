import '../../../app/domain/entities/user_entity/user_entity.dart';

abstract class ProfileRepository {
  Future<UserEntity> getProfile();
}
