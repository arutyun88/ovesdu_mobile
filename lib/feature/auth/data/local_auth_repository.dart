import 'package:injectable/injectable.dart';
import 'package:ovesdu_mobile/app/domain/entities/user_entity/user_entity.dart';

import '../../../app/data/dio_container.dart';
import '../../../app/domain/entities/device_entity/device_entity.dart';
import '../domain/auth_repository.dart';
import '../domain/entities/token_entity/token_entity.dart';
import 'dto/device_dto.dart';
import 'dto/token_dto.dart';
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
    required DeviceEntity device,
  }) async {
    try {
      final response = await dioContainer.dio.post(
        '/auth/info',
        data: UserDto(
          username: username,
          deviceList: [DeviceDto.toDto(device)],
        ).toJson(),
      );
      return UserInfoDto.fromJson(response.data['data']).toString();
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<TokenEntity> signIn({
    required String username,
    required String password,
    required DeviceEntity device,
  }) async {
    try {
      final response = await dioContainer.dio.post(
        '/auth/token',
        data: UserDto(
          username: username,
          password: password,
          deviceList: [DeviceDto.toDto(device)],
        ).toJson(),
      );
      return TokenDto.fromJson(response.data['data']).toEntity();
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<bool> checkUsername(String username) async {
    try {
      final response = await dioContainer.dio.get('/auth/check/$username');
      return response.data['data'] as bool;
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<bool> checkContact({
    required String email,
    required String phoneNumber,
  }) async {
    try {
      final response = await dioContainer.dio.post(
        '/auth/check',
        data: UserDto(
          email: email,
          phoneNumber: phoneNumber,
        ).toJson(),
      );
      return response.data['data'] as bool;
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<TokenEntity> signUp(UserEntity userEntity) {
    // TODO: implement signUp
    throw UnimplementedError();
  }
}
