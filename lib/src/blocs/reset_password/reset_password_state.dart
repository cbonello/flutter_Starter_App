part of 'reset_password_bloc.dart';

@immutable
class ResetPasswordState extends Equatable {
  const ResetPasswordState({
    @required this.isEmailValid,
    @required this.isSubmitting,
    @required this.isSuccess,
    this.email,
    this.exceptionRaised,
  });

  factory ResetPasswordState.empty() {
    return const ResetPasswordState(
      isEmailValid: true,
      isSubmitting: false,
      isSuccess: false,
      email: null,
      exceptionRaised: null,
    );
  }

  factory ResetPasswordState.resetting() {
    return const ResetPasswordState(
      isEmailValid: true,
      isSubmitting: true,
      isSuccess: false,
      email: null,
      exceptionRaised: null,
    );
  }

  factory ResetPasswordState.failure(AppException exception) {
    return ResetPasswordState(
      isEmailValid: true,
      isSubmitting: false,
      isSuccess: false,
      email: null,
      exceptionRaised: exception,
    );
  }

  factory ResetPasswordState.success(String email) {
    return ResetPasswordState(
      isEmailValid: true,
      isSubmitting: false,
      isSuccess: true,
      email: email,
      exceptionRaised: null,
    );
  }

  final bool isEmailValid, isSubmitting, isSuccess;
  final String email;
  final AppException exceptionRaised;

  @override
  List<Object> get props => <Object>[
        isEmailValid,
        isSubmitting,
        isSuccess,
        email,
        exceptionRaised,
      ];

  bool get isFormValid => isEmailValid;

  bool get isFailure => exceptionRaised != null;

  ResetPasswordState update({bool isEmailValid}) {
    return copyWith(
      isEmailValid: isEmailValid,
      isSubmitting: false,
      isSuccess: false,
      email: null,
      exceptionRaised: null,
    );
  }

  ResetPasswordState copyWith({
    bool isEmailValid,
    bool isSubmitEnabled,
    bool isSubmitting,
    bool isSuccess,
    String email,
    AppException exceptionRaised,
  }) {
    return ResetPasswordState(
      isEmailValid: isEmailValid ?? this.isEmailValid,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      email: email ?? this.email,
      exceptionRaised: exceptionRaised,
    );
  }

  @override
  String toString() {
    return '''ResetPasswordState {
      isEmailValid: $isEmailValid,
      isSubmitting: $isSubmitting,
      isSuccess: $isSuccess,
      email: "$email",
      isFailure: $isFailure - "${exceptionRaised.toString()}",
    }''';
  }
}
