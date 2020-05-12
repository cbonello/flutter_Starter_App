part of 'reset_password_bloc.dart';

@freezed
abstract class ResetPasswordState implements _$ResetPasswordState {
  const ResetPasswordState._();

  const factory ResetPasswordState({
    @Default('') String email,
    @Default(false) bool isSubmitting,
    @Default(false) bool isResetEmailSent,
    @nullable AppException exceptionRaised,
  }) = _ResetPasswordState;

  factory ResetPasswordState.empty() => const ResetPasswordState();

  // Space characters are allowed in passwords.
  bool isPopulated() => email.trim().isNotEmpty;
  bool isValidEmail() => Validators.isValidEmail(email);
  bool isValid() => isValidEmail();
  bool isubmitButtonEnabled() => isPopulated() && isValid() && !isSubmitting;
}
