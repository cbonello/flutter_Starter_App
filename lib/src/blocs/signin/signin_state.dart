part of 'signin_bloc.dart';

@freezed
abstract class SignInState implements _$SignInState {
  SignInState._();

  factory SignInState.empty({
    @Default(true) bool isEmailValid,
    @Default(true) bool isPasswordValid,
    @Default(false) bool isSubmitting,
    @Default(false) bool isSuccess,
    @nullable FirebaseUser user,
    @nullable AppException exceptionRaised,
  }) = _Empty;

  factory SignInState.signingIn({
    @Default(true) bool isEmailValid,
    @Default(true) bool isPasswordValid,
    @Default(true) bool isSubmitting,
    @Default(false) bool isSuccess,
    @nullable FirebaseUser user,
    @nullable AppException exceptionRaised,
  }) = _SigningIn;

  factory SignInState.failure({
    @Default(true) bool isEmailValid,
    @Default(true) bool isPasswordValid,
    @Default(false) bool isSubmitting,
    @Default(false) bool isSuccess,
    @nullable FirebaseUser user,
    @required AppException exceptionRaised,
  }) = _Failure;

  factory SignInState.success({
    @Default(true) bool isEmailValid,
    @Default(true) bool isPasswordValid,
    @Default(false) bool isSubmitting,
    @Default(true) bool isSuccess,
    @required FirebaseUser user,
    @nullable AppException exceptionRaised,
  }) = _Success;

  @late
  bool get isFormValid => isEmailValid && isPasswordValid;

  @late
  bool get isFailure => exceptionRaised != null;

  SignInState update({
    bool isEmailValid,
    bool isPasswordValid,
  }) {
    return copyWith(
      isEmailValid: isEmailValid,
      isPasswordValid: isPasswordValid,
      isSubmitting: false,
      isSuccess: false,
      user: null,
      exceptionRaised: null,
    );
  }
}
