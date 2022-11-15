import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../app/domain/entities/device_entity/device_entity.dart';
import '../../../../app/domain/entities/error_entity/error_entity.dart';
import '../../../../app/domain/entities/user_entity/user_entity.dart';
import '../../../location/domain/entities/location_entity/location_entity.dart';
import '../auth_repository.dart';
import '../entities/token_entity/token_entity.dart';

part 'auth_state.dart';

part 'auth_cubit.freezed.dart';

part 'auth_cubit.g.dart';

@Singleton()
class AuthCubit extends HydratedCubit<AuthState> {
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
    } catch (error, stackTrace) {
      addError(error, stackTrace);
    }
  }

  Future<void> checkUsernameSignUp({
    required String username,
  }) async {
    emit(AuthState.waiting());
    try {
      await authRepository.checkUsername(username);
      emit(AuthState.usernameChecked());
    } catch (error, stackTrace) {
      addError(error, stackTrace);
    }
  }

  Future<void> checkContactSignUp({
    required String email,
    required String phoneNumber,
  }) async {
    emit(AuthState.waiting());
    try {
      await authRepository.checkContact(email: email, phoneNumber: phoneNumber);
      emit(AuthState.contactChecked());
    } catch (error, stackTrace) {
      addError(error, stackTrace);
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
    } catch (error, stackTrace) {
      addError(error, stackTrace);
    }
  }

  Future<void> signUp({
    required String username,
    required String email,
    required String phoneNumber,
    required String phoneCountryCode,
    required String name,
    required String dateOfBirth,
    required LocationEntity location,
    required String password,
    required DeviceEntity device,
    required bool genderIsMale,
  }) async {
    emit(AuthState.waiting());
    try {
      final result = await authRepository.signUp(
        UserEntity(
          username: username,
          email: email,
          phoneNumber: phoneNumber,
          phoneCountryCode: phoneCountryCode,
          // todo it
          firstName: name,
          lastName: name,
          dateOfBirth: dateOfBirth,
          location: location,
          password: password,
          device: device,
          genderIsMale: genderIsMale,
        ),
      );
      emit(AuthState.authorized(result));
    } catch (error, stackTrace) {
      addError(error, stackTrace);
    }
  }

  Future<void> refreshToken() async {
    try {
      final refreshToken = state.whenOrNull(
        authorized: (tokens) => tokens.refreshToken,
      );
      final result = await authRepository.refreshToken(
        refreshToken: refreshToken,
      );
      emit(AuthState.authorized(result));
    } catch (error, stackTrace) {
      addError(error, stackTrace);
    }
  }

  void logOut() => emit(AuthState.notAuthorized());

  @override
  AuthState? fromJson(Map<String, dynamic> json) {
    return AuthState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(AuthState state) {
    return state
            .whenOrNull(authorized: (token) => AuthState.authorized(token))
            ?.toJson() ??
        AuthState.notAuthorized().toJson();
  }

  @override
  void addError(Object error, [StackTrace? stackTrace]) {
    emit(AuthState.error(ErrorEntity.fromException(error)));
    super.addError(error, stackTrace);
  }
}
