part of 'signup_bloc.dart';

class SignUpState extends Equatable {
  const SignUpState({
    @required this.isNameValid,
    @required this.isEmailValid,
    @required this.isPasswordValid,
    @required this.isTOSPrivacyAccepted,
    @required this.isSubmitting,
    @required this.isSuccess,
    @required this.user,
    this.exceptionRaised,
  });

  factory SignUpState.empty() {
    return const SignUpState(
      isNameValid: true,
      isEmailValid: true,
      isPasswordValid: true,
      isTOSPrivacyAccepted: true,
      isSubmitting: false,
      isSuccess: false,
      user: null,
      exceptionRaised: null,
    );
  }

  factory SignUpState.loading() {
    return const SignUpState(
      isNameValid: true,
      isEmailValid: true,
      isPasswordValid: true,
      isTOSPrivacyAccepted: true,
      isSubmitting: true,
      isSuccess: false,
      user: null,
      exceptionRaised: null,
    );
  }

  factory SignUpState.failure(AppException exception) {
    return SignUpState(
      isNameValid: true,
      isEmailValid: true,
      isPasswordValid: true,
      isTOSPrivacyAccepted: true,
      isSubmitting: false,
      isSuccess: false,
      user: null,
      exceptionRaised: exception,
    );
  }

  factory SignUpState.success(UserModel user) {
    return SignUpState(
      isNameValid: true,
      isEmailValid: true,
      isPasswordValid: true,
      isTOSPrivacyAccepted: true,
      isSubmitting: false,
      isSuccess: true,
      user: user,
      exceptionRaised: null,
    );
  }

  final bool isNameValid, isEmailValid, isPasswordValid;
  final bool isTOSPrivacyAccepted, isSubmitting, isSuccess;
  final UserModel user;
  final AppException exceptionRaised;

  @override
  List<Object> get props => <Object>[
        isNameValid,
        isEmailValid,
        isPasswordValid,
        isTOSPrivacyAccepted,
        isSubmitting,
        isSuccess,
        user,
        exceptionRaised,
      ];

  bool get isFormValid => isNameValid && isEmailValid && isPasswordValid;

  bool get isFailure => exceptionRaised != null;

  SignUpState update({
    bool isNameValid,
    bool isEmailValid,
    bool isPasswordValid,
    bool isTOSPrivacyAccepted,
  }) {
    return copyWith(
      isNameValid: isNameValid,
      isEmailValid: isEmailValid,
      isPasswordValid: isPasswordValid,
      isTOSPrivacyAccepted: isTOSPrivacyAccepted,
      isSubmitting: false,
      isSuccess: false,
      user: null,
      exceptionRaised: null,
    );
  }

  SignUpState copyWith({
    bool isNameValid,
    bool isEmailValid,
    bool isPasswordValid,
    bool isTOSPrivacyAccepted,
    bool isSubmitEnabled,
    bool isSubmitting,
    UserModel user,
    bool isSuccess,
    AppException exceptionRaised,
  }) {
    return SignUpState(
      isNameValid: isNameValid ?? this.isNameValid,
      isEmailValid: isEmailValid ?? this.isEmailValid,
      isPasswordValid: isPasswordValid ?? this.isPasswordValid,
      isTOSPrivacyAccepted: isTOSPrivacyAccepted ?? this.isTOSPrivacyAccepted,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      user: user,
      exceptionRaised: exceptionRaised,
    );
  }

  @override
  String toString() => '''SignUpState {
      isNameValid: $isNameValid,
      isEmailValid: $isEmailValid,
      isPasswordValid: $isPasswordValid,
      isTOSPrivacyAccepted: $isTOSPrivacyAccepted,
      isSubmitting: $isSubmitting,
      isSuccess: $isSuccess,
      user: $user,
      isFailure: $isFailure - "${exceptionRaised.toString()}",
    }''';
}
