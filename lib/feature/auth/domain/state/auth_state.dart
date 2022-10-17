part of 'auth_cubit.dart';

@freezed
class AuthState with _$AuthState {

  factory AuthState.notAuthorized() = _AuthStateNotAuthorized;

  factory AuthState.authorized() = _AuthStateAuthorized;

  factory AuthState.checked() = _AuthStateNotAuthorized;

  factory AuthState.waiting() = _AuthStateWaiting;

  factory AuthState.error(dynamic error) = _AuthStateError;
}
