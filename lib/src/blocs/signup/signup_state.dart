part of 'signup_bloc.dart';

@freezed
abstract class SignUpState implements _$SignUpState {
  const SignUpState._();

  const factory SignUpState({
    @Default('') String email,
    @Default('') String password,
    @Default(false) bool tosAccepted,
    @Default(false) bool isSubmitting,
    @Default(false) bool isVerificationEmailSent,
    @nullable AppException exceptionRaised,
  }) = _SignUpState;

  factory SignUpState.empty() => const SignUpState();

  // Space characters are allowed in passwords.
  bool isPopulated() => email.trim().isNotEmpty && password.isNotEmpty && tosAccepted;
  bool isValidEmail() => Validators.isValidEmail(email);
  bool isValidPassword() => Validators.isValidPassword(password);
  bool isValid() => isValidEmail() && isValidPassword() && tosAccepted;
  bool isSignUpButtonEnabled() => isPopulated() && isValid() && !isSubmitting;
}
