abstract class AuthRepository {
  Future<dynamic> getName({required String username});

  Future<dynamic> signUpFirstStep({
    required String username,
    required String deviceId,
  });

  Future<dynamic> signUpSecondStep({
    required String email,
    required String phoneNumber,
    required String dayOfBirth,
  });

  Future<dynamic> signUpThirdStep({
    required String password,
  });
}
