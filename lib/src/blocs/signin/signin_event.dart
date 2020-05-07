part of 'signin_bloc.dart';

@freezed
abstract class SignInEvent with _$SignInEvent {
  const factory SignInEvent.emailChanged({String email}) = _EmailChanged;

  const factory SignInEvent.passwordChanged({String password}) = _PasswordChanged;

  const factory SignInEvent.emailAndPasswordPressed() = _EmailAndPasswordPressed;

  const factory SignInEvent.googlePressed() = _GooglePressed;
}
