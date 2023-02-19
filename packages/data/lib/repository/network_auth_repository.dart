import 'package:data/dto/device_dto.dart';
import 'package:data/dto/token_dto.dart';
import 'package:data/dto/user_dto.dart';
import 'package:data/dto/user_info_dto.dart';
import 'package:domain/domain.dart';

class NetworkAuthRepository implements AuthRepository {
  final AuthApi _api;

  NetworkAuthRepository(AuthApi api) : _api = api;

  @override
  Future<String> getName({
    required String username,
    required DeviceEntity device,
  }) async {
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
      final response = await _api.getName(data.toJson());
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
      final response = await _api.signIn(
        UserDto(
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
    try {
      await _api.checkUsername(username);
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<void> checkContact({
    required String email,
    required String phoneNumber,
  }) async {
    try {
      await _api.checkContact(
        UserDto(email: email, phoneNumber: phoneNumber).toJson(),
      );
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<TokenEntity> signUp(UserEntity userEntity) async {
    try {
      final response = await _api.signUp(UserDto.toDto(userEntity).toJson());
      return TokenDto.fromJson(response.data['data']).toEntity();
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<TokenEntity> refreshToken({
    String? refreshToken,
  }) async {
    try {
      final response = await _api.refreshToken(refreshToken);
      return TokenDto.fromJson(response.data['data']).toEntity();
    } catch (_) {
      rethrow;
    }
  }
}
