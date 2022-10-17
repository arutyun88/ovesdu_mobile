import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ovesdu_mobile/feature/auth/domain/auth_repository.dart';

part 'auth_state.dart';

part 'auth_cubit.freezed.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepository) : super(AuthState.notAuthorized());

  final AuthRepository authRepository;

  Future<void> checkUsername({
    required String username,
  }) async {
    emit(AuthState.waiting());
    try {
      final result = await authRepository.getName(username: username);
      emit(AuthState.checked(result));
    } catch (error) {
      emit(AuthState.error(error));
      rethrow;
    }
  }
}
