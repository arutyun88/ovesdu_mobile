import '../../../app/domain/entities/device_entity/device_entity.dart';
import 'entities/token_entity/token_entity.dart';

abstract class AuthRepository {
  Future<dynamic> getName({
    required String username,
    required DeviceEntity device,
  });

  Future<bool> checkUsername(String username);

  Future<bool> checkContact({
    required String email,
    required String phoneNumber,
  });

  Future<TokenEntity> signIn({
    required String username,
    required String password,
    required DeviceEntity device,
  });
}
