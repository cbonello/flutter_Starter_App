part of 'signin_bloc.dart';

abstract class SignInEvent extends Equatable {
  const SignInEvent();

  @override
  List<Object> get props => <Object>[];
}

class EmailChangedSignInEvent extends SignInEvent {
  const EmailChangedSignInEvent({@required this.email});

  final String email;

  @override
  List<Object> get props => <Object>[email];

  @override
  String toString() => 'EmailChangedSignInEvent { email: "$email" }';
}

class PasswordChangedSignInEvent extends SignInEvent {
  const PasswordChangedSignInEvent({@required this.password});

  final String password;

  @override
  List<Object> get props => <Object>[password];

  @override
  String toString() => 'PasswordChangedSignInEvent { password: "$password" }';
}

class EmailAndPasswordPressedSignInEvent extends SignInEvent {
  const EmailAndPasswordPressedSignInEvent({
    @required this.email,
    @required this.password,
  });

  final String email;
  final String password;

  @override
  List<Object> get props => <Object>[email, password];

  @override
  String toString() {
    return 'EmailAndPasswordPressedSignInEvent { email: "$email", password: "$password" }';
  }
}

class GooglePressedSignInEvent extends SignInEvent {}
