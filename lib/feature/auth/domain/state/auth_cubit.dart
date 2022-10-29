import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../app/domain/entities/device_entity/device_entity.dart';
import '../../../../app/domain/entities/user_entity/user_entity.dart';
import '../auth_repository.dart';
import '../entities/token_entity/token_entity.dart';

part 'auth_state.dart';

part 'auth_cubit.freezed.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepository) : super(AuthState.notAuthorized());

  final AuthRepository authRepository;

  Future<void> checkUsernameSignIn({
    required String username,
    required DeviceEntity device,
  }) async {
    emit(AuthState.waiting());
    try {
      final result = await authRepository.getName(
        username: username,
        device: device,
      );
      emit(AuthState.checked(result));
    } catch (error) {
      emit(AuthState.error(error));
      rethrow;
    }
  }

  Future<void> checkUsernameSignUp({
    required String username,
  }) async {
    emit(AuthState.waiting());
    try {
      final result = await authRepository.checkUsername(username);
      emit(AuthState.usernameChecked(result));
    } catch (error) {
      emit(AuthState.error(error));
      rethrow;
    }
  }

  Future<void> checkContactSignUp({
    required String email,
    required String phoneNumber,
  }) async {
    emit(AuthState.waiting());
    try {
      final result = await authRepository.checkContact(
        email: email,
        phoneNumber: phoneNumber,
      );
      emit(AuthState.contactChecked(result));
    } catch (error) {
      emit(AuthState.error(error));
      rethrow;
    }
  }

  Future<void> signIn({
    required String username,
    required String password,
    required DeviceEntity device,
  }) async {
    emit(AuthState.waiting());
    try {
      final result = await authRepository.signIn(
        username: username,
        password: password,
        device: device,
      );
      emit(AuthState.authorized(result));
    } catch (error) {
      emit(AuthState.error(error));
      rethrow;
    }
  }

  Future<void> signUp({
    required String username,
    required String email,
    required String phoneNumber,
    required String phoneCountryCode,
    required String name,
    required String dateOfBirth,
    required String country,
    required String city,
    required String password,
    required DeviceEntity device,
  }) async {
    emit(AuthState.waiting());
    try {
      final result = await authRepository.signUp(
        UserEntity(
          username: username,
          email: email,
          phoneNumber: phoneNumber,
          phoneCountryCode: phoneCountryCode,
          name: name,
          dateOfBirth: dateOfBirth,
          country: country,
          city: city,
          password: password,
          device: device,
        ),
      );
      emit(AuthState.authorized(result));
    } catch (error) {
      emit(AuthState.error(error));
      rethrow;
    }
  }
}
