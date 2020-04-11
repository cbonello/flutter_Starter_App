part of 'authentication_bloc.dart';

@freezed
abstract class AuthenticationState with _$AuthenticationState {
  const factory AuthenticationState.uninitialized() = _Uninitialized;

  const factory AuthenticationState.authenticated({
    FirebaseUser authenticatedUser,
  }) = _Authenticated;

  const factory AuthenticationState.unauthenticated() = _Unauthenticated;
}
