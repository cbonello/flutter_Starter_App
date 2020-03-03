part of 'reset_password_bloc.dart';

abstract class ResetPasswordEvent extends Equatable {
  const ResetPasswordEvent();

  @override
  List<Object> get props => <Object>[];
}

class EmailChangedResetPasswordEvent extends ResetPasswordEvent {
  const EmailChangedResetPasswordEvent({@required this.email});

  final String email;

  @override
  List<Object> get props => <Object>[email];

  @override
  String toString() => 'EmailChangedResetPasswordEvent { email: "$email" }';
}

class ResetPressedResetPasswordEvent extends ResetPasswordEvent {
  const ResetPressedResetPasswordEvent({@required this.email});

  final String email;

  @override
  List<Object> get props => <Object>[email];

  @override
  String toString() => 'ResetPressedResetPasswordEvent { email: "$email" }';
}
