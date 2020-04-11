part of 'signup_bloc.dart';

@freezed
abstract class SignUpState implements _$SignUpState {
  SignUpState._();

  factory SignUpState.empty({
    @Default(true) bool isEmailValid,
    @Default(true) bool isPasswordValid,
    @Default(false) bool isSubmitting,
    @Default(false) bool isSuccess,
    @nullable FirebaseUser user,
    @nullable AppException exceptionRaised,
  }) = _Empty;

  factory SignUpState.loading({
    @Default(true) bool isEmailValid,
    @Default(true) bool isPasswordValid,
    @Default(true) bool isSubmitting,
    @Default(false) bool isSuccess,
    @nullable FirebaseUser user,
    @nullable AppException exceptionRaised,
  }) = _Loading;

  factory SignUpState.failure({
    @Default(true) bool isEmailValid,
    @Default(true) bool isPasswordValid,
    @Default(false) bool isSubmitting,
    @Default(false) bool isSuccess,
    @nullable FirebaseUser user,
    AppException exceptionRaised,
  }) = _Failure;

  factory SignUpState.emailSent({
    @Default(true) bool isEmailValid,
    @Default(true) bool isPasswordValid,
    @Default(false) bool isSubmitting,
    @Default(true) bool isSuccess,
    FirebaseUser user,
    @nullable AppException exceptionRaised,
  }) = _Success;

  @late
  bool get isFormValid => isEmailValid && isPasswordValid;

  @late
  bool get isFailure => exceptionRaised != null;

  SignUpState update({
    bool isEmailValid,
    bool isPasswordValid,
    FirebaseUser user,
  }) {
    return copyWith(
      isEmailValid: isEmailValid,
      isPasswordValid: isPasswordValid,
      isSubmitting: false,
      isSuccess: false,
      user: user,
      exceptionRaised: null,
    );
  }
}
