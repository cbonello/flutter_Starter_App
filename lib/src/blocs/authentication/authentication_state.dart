part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => <Object>[];
}

class UninitializedAuthenticationState extends AuthenticationState {}

class AuthenticatedAuthenticationState extends AuthenticationState {
  const AuthenticatedAuthenticationState({@required this.authenticatedUser})
      : assert(authenticatedUser != null);

  final UserModel authenticatedUser;

  @override
  List<Object> get props => <Object>[authenticatedUser];

  @override
  String toString() =>
      'AuthenticatedAuthenticationState { authenticatedUser: $authenticatedUser }';
}

class UnauthenticatedAuthenticationState extends AuthenticationState {}
