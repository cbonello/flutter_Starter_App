part of 'signin_bloc.dart';

@freezed
abstract class SignInState implements _$SignInState {
  const SignInState._();

  const factory SignInState({
    @Default('') String email,
    @Default('') String password,
    @Default(false) bool isSubmitting,
    @nullable FirebaseUser user,
    @nullable AppException exceptionRaised,
  }) = _SignInState;

  factory SignInState.empty() => const SignInState(
        email: '',
        password: '',
        isSubmitting: false,
      );

  // Space characters are allowed in passwords.
  bool isPopulated() => email.trim().isNotEmpty && password.isNotEmpty;
  bool isValidEmail() => Validators.isValidEmail(email);
  bool isValidPassword() => password.isNotEmpty;
  bool isValid() => isValidEmail() && isValidPassword();
  bool isSignInButtonEnabled() => isPopulated() && isValid() && !isSubmitting;
}
