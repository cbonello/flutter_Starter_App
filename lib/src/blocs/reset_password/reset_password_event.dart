part of 'reset_password_bloc.dart';

@freezed
abstract class ResetPasswordEvent with _$ResetPasswordEvent {
  const factory ResetPasswordEvent.emailChanged({String email}) = _EmailChanged;

  const factory ResetPasswordEvent.resetPressed() = _ResetPressed;
}
