import 'package:domain/entity/device_entity/device_entity.dart';
import 'package:domain/entity/token_entity/token_entity.dart';
import 'package:domain/entity/user_entity/user_entity.dart';

abstract class AuthRepository {
  Future<dynamic> getName({
    required String username,
    required DeviceEntity device,
  });

  Future<void> checkUsername(String username);

  Future<void> checkContact({
    required String email,
    required String phoneNumber,
  });

  Future<TokenEntity> signIn({
    required String username,
    required String password,
    required DeviceEntity device,
  });

  Future<TokenEntity> signUp(UserEntity userEntity);

  Future<TokenEntity> refreshToken({
    String? refreshToken,
  });
}
