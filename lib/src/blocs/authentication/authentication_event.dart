part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => <Object>[];
}

class AppStartedAuthenticationEvent extends AuthenticationEvent {}

class SignedInAuthenticationEvent extends AuthenticationEvent {
  const SignedInAuthenticationEvent({@required this.user}) : assert(user != null);

  final FirebaseUser user;

  @override
  List<Object> get props => <Object>[user];

  @override
  String toString() => 'SignedInAuthenticationEvent { user: $user }';
}

class SignedOutAuthenticationEvent extends AuthenticationEvent {}
