part of 'auth_cubit.dart';

@freezed
class AuthState with _$AuthState {
  factory AuthState.notAuthorized() = _AuthStateNotAuthorized;

  factory AuthState.authorized(TokenEntity tokenEntity) = _AuthStateAuthorized;

  factory AuthState.checked(String name) = _AuthStateChecked;

  factory AuthState.valueChecked(bool value) = _AuthStateValueChecked;

  factory AuthState.waiting() = _AuthStateWaiting;

  factory AuthState.error(dynamic error) = _AuthStateError;
}
