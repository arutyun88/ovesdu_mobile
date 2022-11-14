import 'package:injectable/injectable.dart';

import '../../../app/domain/entities/device_entity/device_entity.dart';
import '../../../app/domain/entities/user_entity/user_entity.dart';
import '../domain/auth_repository.dart';
import '../domain/entities/token_entity/token_entity.dart';

@Injectable(as: AuthRepository)
@test
class MockAuthRepository implements AuthRepository {
  @override
  Future getName({
    required String username,
    required DeviceEntity device,
  }) {
    return Future.delayed(
      const Duration(seconds: 1),
      () {
        if (username != 'some') {
          throw Exception('test_exception');
        }
        return 'Пользователь';
      },
    );
  }

  @override
  Future<void> checkUsername(String username) {
    return Future.delayed(
      const Duration(seconds: 1),
      () {},
    );
  }

  @override
  Future<void> checkContact({
    required String email,
    required String phoneNumber,
  }) {
    return Future.delayed(
      const Duration(seconds: 1),
      () {},
    );
  }

  @override
  Future<TokenEntity> signIn({
    required String username,
    required String password,
    required DeviceEntity device,
  }) {
    return Future.delayed(
      const Duration(seconds: 1),
      () {
        if (username != 'some') {
          throw Exception('test');
        }
        return const TokenEntity(accessToken: '', refreshToken: '');
      },
    );
  }

  @override
  Future<TokenEntity> signUp(UserEntity userEntity) {
    return Future.delayed(
      const Duration(seconds: 1),
      () {
        if (userEntity.username != 'some') {
          throw Exception('test exception');
        }
        return const TokenEntity(accessToken: '', refreshToken: '');
      },
    );
  }

  @override
  Future<TokenEntity> refreshToken({
    String? refreshToken,
  }) {
    // TODO: implement refreshToken
    throw UnimplementedError();
  }
}
