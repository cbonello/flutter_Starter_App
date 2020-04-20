import 'package:bloc_test/bloc_test.dart';

import 'package:flutter_auth/src/blocs/authentication/authentication_bloc.dart';
import 'package:flutter_auth/src/blocs/reset_password/reset_password_bloc.dart';
import 'package:flutter_auth/src/blocs/signin/signin_bloc.dart';
import 'package:flutter_auth/src/blocs/signup/signup_bloc.dart';

class MockAuthenticationBloc extends MockBloc<AuthenticationEvent, AuthenticationState>
    implements AuthenticationBloc {}

class MockResetPasswordBloc extends MockBloc<ResetPasswordEvent, ResetPasswordState>
    implements ResetPasswordBloc {}

class MockSignInBloc extends MockBloc<SignInEvent, SignInState> implements SignInBloc {}

class MockSignUpBloc extends MockBloc<SignUpEvent, SignUpState> implements SignUpBloc {}
