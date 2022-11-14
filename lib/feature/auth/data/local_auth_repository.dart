import 'package:injectable/injectable.dart';

import '../../../app/data/dio_container.dart';
import '../../../app/domain/entities/device_entity/device_entity.dart';
import '../../../app/domain/entities/user_entity/user_entity.dart';
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
    await dioContainer.setHeaderLocale();
    try {
      final UserDto data = username.contains('@')
          ? UserDto(
              email: username,
              deviceList: [DeviceDto.toDto(device)],
            )
          : UserDto(
              username: username,
              deviceList: [DeviceDto.toDto(device)],
            );
      final response = await dioContainer.dio.post(
        '/auth/info',
        data: data.toJson(),
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
    await dioContainer.setHeaderLocale();
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
  Future<void> checkUsername(String username) async {
    await dioContainer.setHeaderLocale();
    try {
      await dioContainer.dio.get('/auth/check/$username');
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<void> checkContact({
    required String email,
    required String phoneNumber,
  }) async {
    await dioContainer.setHeaderLocale();
    try {
      await dioContainer.dio.post(
        '/auth/check',
        data: UserDto(
          email: email,
          phoneNumber: phoneNumber,
        ).toJson(),
      );
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<TokenEntity> signUp(UserEntity userEntity) async {
    await dioContainer.setHeaderLocale();
    try {
      final response = await dioContainer.dio.put(
        '/auth/token',
        data: UserDto.toDto(userEntity).toJson(),
      );
      return TokenDto.fromJson(response.data['data']).toEntity();
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<TokenEntity> refreshToken({
    String? refreshToken,
  }) async {
    await dioContainer.setHeaderLocale();
    try {
      final response = await dioContainer.dio.post('/auth/token/$refreshToken');
      return TokenDto.fromJson(response.data['data']).toEntity();
    } catch (_) {
      rethrow;
    }
  }
}
