part of 'signup_bloc.dart';

@freezed
abstract class SignUpEvent with _$SignUpEvent {
  const factory SignUpEvent.emailChanged({String email}) = _EmailChanged;

  const factory SignUpEvent.passwordChanged({String password}) = _PasswordChanged;

  const factory SignUpEvent.tosChanged({bool tos}) = _ToSChanged;

  const factory SignUpEvent.submitted() = _Submitted;
}
