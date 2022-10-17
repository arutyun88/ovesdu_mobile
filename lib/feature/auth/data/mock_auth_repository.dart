import 'package:injectable/injectable.dart';
import 'package:ovesdu_mobile/feature/auth/domain/auth_repository.dart';

@Injectable(as: AuthRepository)
@test
class MockAuthRepository implements AuthRepository {
  @override
  Future getName({
    required String username,
  }) {
    // throw Exception('test');
    return Future.delayed(
      const Duration(seconds: 2),
      () {
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
