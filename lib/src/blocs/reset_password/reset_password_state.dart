part of 'reset_password_bloc.dart';

@freezed
abstract class ResetPasswordState implements _$ResetPasswordState {
  ResetPasswordState._();

  factory ResetPasswordState.empty({
    @Default(true) bool isEmailValid,
    @Default(false) bool isSubmitting,
    @Default(false) bool isSuccess,
    @nullable String email,
    @nullable AppException exceptionRaised,
  }) = _Empty;

  factory ResetPasswordState.resetting({
    @Default(true) bool isEmailValid,
    @Default(true) bool isSubmitting,
    @Default(false) bool isSuccess,
    @nullable String email,
    @nullable AppException exceptionRaised,
  }) = _Resetting;

  factory ResetPasswordState.failure({
    @Default(true) bool isEmailValid,
    @Default(false) bool isSubmitting,
    @Default(false) bool isSuccess,
    @nullable String email,
    AppException exceptionRaised,
  }) = _Failure;

  factory ResetPasswordState.success({
    @Default(true) bool isEmailValid,
    @Default(false) bool isSubmitting,
    @Default(true) bool isSuccess,
    String email,
    @nullable AppException exceptionRaised,
  }) = _Success;

  @late
  bool get isFormValid => isEmailValid;

  @late
  bool get isFailure => exceptionRaised != null;

  ResetPasswordState update({@required bool isEmailValid, @required String email}) {
    return copyWith(
      isEmailValid: isEmailValid,
      isSubmitting: false,
      isSuccess: false,
      email: email,
      exceptionRaised: null,
    );
  }
}
