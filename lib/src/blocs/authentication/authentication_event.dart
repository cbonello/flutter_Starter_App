part of 'authentication_bloc.dart';

@freezed
abstract class AuthenticationEvent with _$AuthenticationEvent {
  const factory AuthenticationEvent.appStarted() = _AppStarted;

  const factory AuthenticationEvent.signedIn({FirebaseUser user}) = _SignedIn;

  const factory AuthenticationEvent.signedOut() = _SignedOut;
}
