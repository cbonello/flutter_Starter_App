part of 'signin_bloc.dart';

@immutable
class SignInState extends Equatable {
  const SignInState({
    @required this.isEmailValid,
    @required this.isPasswordValid,
    @required this.isSubmitting,
    @required this.isSuccess,
    @required this.user,
    @required this.exceptionRaised,
  });

  factory SignInState.empty() {
    return const SignInState(
      isEmailValid: true,
      isPasswordValid: true,
      isSubmitting: false,
      isSuccess: false,
      user: null,
      exceptionRaised: null,
    );
  }

  factory SignInState.signingIn() {
    return const SignInState(
      isEmailValid: true,
      isPasswordValid: true,
      isSubmitting: true,
      isSuccess: false,
      user: null,
      exceptionRaised: null,
    );
  }

  factory SignInState.failure(AppException exception) {
    return SignInState(
      isEmailValid: true,
      isPasswordValid: true,
      isSubmitting: false,
      isSuccess: false,
      user: null,
      exceptionRaised: exception,
    );
  }

  factory SignInState.success(UserModel user) {
    return SignInState(
      isEmailValid: true,
      isPasswordValid: true,
      isSubmitting: false,
      isSuccess: true,
      user: user,
      exceptionRaised: null,
    );
  }

  final bool isEmailValid, isPasswordValid, isSubmitting, isSuccess;
  final UserModel user;
  final AppException exceptionRaised;

  @override
  List<Object> get props => <Object>[
        isEmailValid,
        isPasswordValid,
        isSubmitting,
        isSuccess,
        user,
        exceptionRaised,
      ];

  bool get isFormValid => isEmailValid && isPasswordValid;

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

  SignInState copyWith({
    bool isEmailValid,
    bool isPasswordValid,
    bool isSubmitEnabled,
    bool isSubmitting,
    bool isSuccess,
    UserModel user,
    AppException exceptionRaised,
  }) {
    return SignInState(
      isEmailValid: isEmailValid ?? this.isEmailValid,
      isPasswordValid: isPasswordValid ?? this.isPasswordValid,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      user: user,
      exceptionRaised: exceptionRaised,
    );
  }

  @override
  String toString() {
    return '''SigninState {
      isEmailValid: $isEmailValid,
      isPasswordValid: $isPasswordValid,
      isSubmitting: $isSubmitting,
      isSuccess: $isSuccess,
      user: $user,
      isFailure: $isFailure - "${exceptionRaised.toString()}",
    }''';
  }
}
