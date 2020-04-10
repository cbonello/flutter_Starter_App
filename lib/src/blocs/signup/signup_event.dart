part of 'signup_bloc.dart';

@freezed
abstract class SignUpEvent with _$SignUpEvent {
  const factory SignUpEvent.emailChanged({@required String email}) = _EmailChanged;

  const factory SignUpEvent.passwordChanged({
    @required String password,
  }) = _PasswordChanged;

  // const factory SignUpEvent.tosPrivacyChanged({
  //   @required bool tosPrivacyAccepted,
  // }) = _TOSPrivacyChanged;

  const factory SignUpEvent.submitted({
    @required String email,
    @required String password,
  }) = _Submitted;
}

// @immutable
// abstract class SignUpEvent extends Equatable {
//   const SignUpEvent();

//   @override
//   List<Object> get props => <Object>[];
// }

// class EmailChangedSignUpEvent extends SignUpEvent {
//   const EmailChangedSignUpEvent({@required this.email});

//   final String email;

//   @override
//   List<Object> get props => <Object>[email];

//   @override
//   String toString() => 'EmailChangedSignUpEvent { email: "$email" }';
// }

// class PasswordChangedSignUpEvent extends SignUpEvent {
//   const PasswordChangedSignUpEvent({@required this.password});

//   final String password;

//   @override
//   List<Object> get props => <Object>[password];

//   @override
//   String toString() => 'PasswordChangedSignUpEvent { password: "$password" }';
// }

// class TOSPrivacyChangedSignUpEvent extends SignUpEvent {
//   const TOSPrivacyChangedSignUpEvent({@required this.tosPrivacyAccepted});

//   final bool tosPrivacyAccepted;

//   @override
//   List<Object> get props => <Object>[tosPrivacyAccepted];

//   @override
//   String toString() =>
//       'TOSPrivacyChangedSignUpEvent { TOS/Privacy Accepted: $tosPrivacyAccepted }';
// }

// class SubmittedSignUpEvent extends SignUpEvent {
//   const SubmittedSignUpEvent({
//     @required this.email,
//     @required this.password,
//     @required this.tosPrivacyAccepted,
//   });

//   final String email, password;
//   final bool tosPrivacyAccepted;

//   @override
//   List<Object> get props => <Object>[email, password, tosPrivacyAccepted];

//   @override
//   String toString() {
//     return '''SubmittedSignUpEvent {
//       email: "$email",
//       password: "$password",
//       TOS/Privacy Accepted: $tosPrivacyAccepted
//     }''';
//   }
// }
