part of 'signin_bloc.dart';

@freezed
abstract class SignInEvent with _$SignInEvent {
  const factory SignInEvent.emailChanged({@required String email}) = _EmailChanged;

  const factory SignInEvent.passwordChanged({
    @required String password,
  }) = _PasswordChanged;

  const factory SignInEvent.emailAndPasswordPressed({
    @required String email,
    @required String password,
  }) = _EmailAndPasswordPressed;

  const factory SignInEvent.googlePressed() = _GooglePressed;
}
