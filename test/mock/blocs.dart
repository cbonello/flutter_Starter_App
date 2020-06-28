import 'package:bloc_test/bloc_test.dart';

import 'package:flutter_starter_app/src/blocs/blocs.dart';

class MockAuthenticationBloc extends MockBloc<AuthenticationEvent, AuthenticationState>
    implements AuthenticationBloc {}

class MockResetPasswordBloc extends MockBloc<ResetPasswordEvent, ResetPasswordState>
    implements ResetPasswordBloc {}

class MockSignInBloc extends MockBloc<SignInEvent, SignInState> implements SignInBloc {}

class MockSignUpBloc extends MockBloc<SignUpEvent, SignUpState> implements SignUpBloc {}
