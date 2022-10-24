import 'package:injectable/injectable.dart';
import 'package:ovesdu_mobile/feature/auth/domain/auth_repository.dart';

import '../../../app/domain/entities/device_entity/device_entity.dart';

@Injectable(as: AuthRepository)
@test
class MockAuthRepository implements AuthRepository {
  @override
  Future getName({
    required String username,
    required DeviceEntity device,
  }) {
    return Future.delayed(
      const Duration(seconds: 2),
      () {
        // throw Exception('test');
        return 'Пользователь';
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
