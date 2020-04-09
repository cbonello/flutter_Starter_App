part of 'authentication_bloc.dart';

@freezed
abstract class AuthenticationState with _$AuthenticationState {
  const factory AuthenticationState.uninitialized() = _Uninitialized;
  const factory AuthenticationState.authenticated({
    @required FirebaseUser authenticatedUser,
  }) = _Authenticated;
  const factory AuthenticationState.unauthenticated() = _Unauthenticated;
}

// @immutable
// abstract class AuthenticationState extends Equatable {
//   const AuthenticationState();

//   @override
//   List<Object> get props => <Object>[];
// }

// class UninitializedAuthenticationState extends AuthenticationState {}

// class AuthenticatedAuthenticationState extends AuthenticationState {
//   const AuthenticatedAuthenticationState({@required this.authenticatedUser})
//       : assert(authenticatedUser != null);

//   final FirebaseUser authenticatedUser;

//   @override
//   List<Object> get props => <Object>[authenticatedUser];

//   @override
//   String toString() =>
//       'AuthenticatedAuthenticationState { authenticatedUser: $authenticatedUser }';
// }

// class UnauthenticatedAuthenticationState extends AuthenticationState {}
