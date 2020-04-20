import 'package:bloc_test/bloc_test.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:flutter_auth/src/blocs/signup/signup_bloc.dart';
import 'package:flutter_auth/src/repositories/authentication_repository.dart';
import 'package:flutter_auth/src/utils/exceptions.dart';

import '../mock/firebase_auth.dart';
import '../mock/repositories.dart';

const String kMockEmail = 'john.doe@yahoo.com';
const String kMockPassword = 'password1234';

Future<void> main() async {
  group('SignUp Bloc:', () {
    final AuthenticationRepository authRepositoryMock = MockAuthenticationRepository();
    final FirebaseUser authenticatedUser = MockFirebaseUser();
    final AppException exception = AppException.fromCode('ERROR_SiGN_IN_CANCEL');

    group('Initialization:', () {
      blocTest<SignUpBloc, SignUpEvent, SignUpState>(
        'initial state is SignUpState.empty()',
        build: () async => SignUpBloc(authRepository: authRepositoryMock),
        skip: 0,
        expect: <SignUpState>[SignUpState.empty()],
      );
    });

    group('EmailChanged:', () {
      blocTest<SignUpBloc, SignUpEvent, SignUpState>(
        'invalid email',
        build: () async => SignUpBloc(authRepository: authRepositoryMock)
          ..add(const SignUpEvent.emailChanged(email: 'abcd')),
        act: (SignUpBloc bloc) async {
          bloc.add(const SignUpEvent.emailChanged(email: 'abcd@'));
        },
        skip: 0,
        wait: const Duration(milliseconds: 300),
        expect: <SignUpState>[
          SignUpState.empty(),
          SignUpState.empty(isEmailValid: false),
        ],
      );

      blocTest<SignUpBloc, SignUpEvent, SignUpState>(
        'valid email',
        build: () async => SignUpBloc(authRepository: authRepositoryMock),
        act: (SignUpBloc bloc) async =>
            bloc.add(const SignUpEvent.emailChanged(email: 'abcd@efgh.com')),
        skip: 0,
        wait: const Duration(milliseconds: 300),
        expect: <SignUpState>[SignUpState.empty()],
      );
    });

    group('PasswordChanged:', () {
      blocTest<SignUpBloc, SignUpEvent, SignUpState>(
        'invalid password',
        build: () async => SignUpBloc(authRepository: authRepositoryMock),
        act: (SignUpBloc bloc) async =>
            bloc.add(const SignUpEvent.passwordChanged(password: '')),
        skip: 0,
        wait: const Duration(milliseconds: 300),
        expect: <SignUpState>[
          SignUpState.empty(),
          SignUpState.empty(isPasswordValid: false)
        ],
      );

      blocTest<SignUpBloc, SignUpEvent, SignUpState>(
        'valid password',
        build: () async => SignUpBloc(authRepository: authRepositoryMock),
        act: (SignUpBloc bloc) async =>
            bloc.add(const SignUpEvent.passwordChanged(password: 'flutter_12345')),
        skip: 0,
        wait: const Duration(milliseconds: 300),
        expect: <SignUpState>[SignUpState.empty()],
      );
    });

    group('Submitted event:', () {
      blocTest<SignUpBloc, SignUpEvent, SignUpState>(
        'Sign up successfully',
        build: () async {
          when(authRepositoryMock.signUp(
            email: kMockEmail,
            password: kMockPassword,
          )).thenAnswer((_) {
            return Future<FirebaseUser>.value(authenticatedUser);
          });
          return SignUpBloc(authRepository: authRepositoryMock);
        },
        act: (SignUpBloc bloc) async {
          bloc.add(
            const SignUpEvent.submitted(email: kMockEmail, password: kMockPassword),
          );
        },
        expect: <SignUpState>[
          SignUpState.signingUp(),
          SignUpState.emailSent(user: authenticatedUser)
        ],
      );

      blocTest<SignUpBloc, SignUpEvent, SignUpState>(
        'Sign up (exception thrown by authentication repository)',
        build: () async {
          when(authRepositoryMock.signUp(
            email: kMockEmail,
            password: kMockPassword,
          )).thenThrow(exception);
          return SignUpBloc(authRepository: authRepositoryMock);
        },
        act: (SignUpBloc bloc) async {
          bloc.add(
            const SignUpEvent.submitted(email: kMockEmail, password: kMockPassword),
          );
        },
        expect: <SignUpState>[
          SignUpState.signingUp(),
          SignUpState.failure(exceptionRaised: exception)
        ],
      );
    });
  });
}
