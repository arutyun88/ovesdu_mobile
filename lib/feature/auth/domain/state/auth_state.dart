part of 'auth_cubit.dart';

@freezed
class AuthState with _$AuthState {
  factory AuthState.notAuthorized() = _AuthStateNotAuthorized;

  factory AuthState.authorized(TokenEntity tokenEntity) = _AuthStateAuthorized;

  factory AuthState.checked(String name) = _AuthStateChecked;

  factory AuthState.usernameChecked(bool value) = _AuthStateUsernameChecked;

  factory AuthState.contactChecked(bool value) = _AuthStateContactChecked;

  factory AuthState.waiting() = _AuthStateWaiting;

  factory AuthState.error(ErrorEntity error) = _AuthStateError;

  factory AuthState.fromJson(Map<String, dynamic> json) =>
      _$AuthStateFromJson(json);
}
