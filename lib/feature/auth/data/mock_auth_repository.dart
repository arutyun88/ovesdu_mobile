import 'package:injectable/injectable.dart';

import '../../../app/domain/entities/device_entity/device_entity.dart';
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
  Future<bool> checkUsername(String username) {
    return Future.delayed(
      const Duration(seconds: 1),
      () {
        return username == 'some';
      },
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
  Future signUpFirstStep({
    required String username,
    required String deviceId,
  }) {
    return Future.delayed(
      const Duration(seconds: 2),
      () => false,
    );
  }

  @override
  Future signUpSecondStep({
    required String email,
    required String phoneNumber,
    required String dayOfBirth,
  }) {
    throw UnimplementedError();
  }

  @override
  Future signUpThirdStep({
    required String password,
  }) {
    throw UnimplementedError();
  }
}
