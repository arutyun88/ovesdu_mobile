import 'package:injectable/injectable.dart';

import '../../../app/data/dio_container.dart';
import '../domain/auth_repository.dart';
import 'dto/device_dto.dart';
import 'dto/user_dto.dart';
import 'dto/user_info_dto.dart';

@Injectable(as: AuthRepository)
@dev
class LocalAuthRepository implements AuthRepository {
  final DioContainer dioContainer;

  LocalAuthRepository(this.dioContainer);

  @override
  Future<String> getName({
    required String username,
  }) async {
    try {
      final response = await dioContainer.dio.post(
        '/auth/info',
        data: UserDto(
          username: username,
          deviceList: [
            DeviceDto(
              deviceType: 'deviceType',
              deviceId: 'device',
            )
          ],
        ).toJson(),
      );
      return UserInfoDto.fromJson(response.data['data']).toString();
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future signUpFirstStep({required String username, required String deviceId}) {
    // TODO: implement signUpFirstStep
    throw UnimplementedError();
  }

  @override
  Future signUpSecondStep(
      {required String email,
      required String phoneNumber,
      required String dayOfBirth}) {
    // TODO: implement signUpSecondStep
    throw UnimplementedError();
  }

  @override
  Future signUpThirdStep({required String password}) {
    // TODO: implement signUpThirdStep
    throw UnimplementedError();
  }
}
