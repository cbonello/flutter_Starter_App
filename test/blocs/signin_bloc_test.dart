import 'package:bloc_test/bloc_test.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:flutter_auth/src/blocs/signin/signin_bloc.dart';
import 'package:flutter_auth/src/repositories/authentication_repository.dart';
import 'package:flutter_auth/src/services/analytics.dart';
import 'package:flutter_auth/src/utils/exceptions.dart';

import '../mock/firebase_auth.dart';
import '../mock/repositories.dart';
import '../mock/services.dart';

const String kMockEmail = 'john.doe@yahoo.com';
const String kMockPassword = 'password1234';

Future<void> main() async {
  group('SignIn Bloc:', () {
    final AuthenticationRepository authRepositoryMock = MockAuthenticationRepository();
    final AnalyticsService analyticsServiceMock = MockAnalyticsService();
    final FirebaseUser authenticatedUser = MockFirebaseUser();
    const AppException exception = AppException(code: 'ERROR_EMAIL_NOT_VERIFIED');

    group('Initialization:', () {
      blocTest<SignInBloc, SignInEvent, SignInState>(
        'initial state is SignInState.empty()',
        build: () async => SignInBloc(
          authRepository: authRepositoryMock,
          analyticsService: analyticsServiceMock,
        ),
        skip: 0,
        expect: <SignInState>[SignInState.empty()],
      );
    });

    group('EmailChanged:', () {
      blocTest<SignInBloc, SignInEvent, SignInState>(
        'invalid email',
        build: () async => SignInBloc(
          authRepository: authRepositoryMock,
          analyticsService: analyticsServiceMock,
        )..add(const SignInEvent.emailChanged(email: 'abcd')),
        act: (SignInBloc bloc) async {
          bloc.add(const SignInEvent.emailChanged(email: 'abcd@'));
        },
        skip: 0,
        wait: const Duration(milliseconds: 300),
        expect: <SignInState>[
          SignInState.empty(),
          SignInState.empty(isEmailValid: false),
        ],
      );

      blocTest<SignInBloc, SignInEvent, SignInState>(
        'valid email',
        build: () async => SignInBloc(
          authRepository: authRepositoryMock,
          analyticsService: analyticsServiceMock,
        ),
        act: (SignInBloc bloc) async =>
            bloc.add(const SignInEvent.emailChanged(email: 'abcd@efgh.com')),
        skip: 0,
        wait: const Duration(milliseconds: 300),
        expect: <SignInState>[SignInState.empty()],
      );
    });

    group('PasswordChanged:', () {
      blocTest<SignInBloc, SignInEvent, SignInState>(
        'invalid password',
        build: () async => SignInBloc(
          authRepository: authRepositoryMock,
          analyticsService: analyticsServiceMock,
        ),
        act: (SignInBloc bloc) async =>
            bloc.add(const SignInEvent.passwordChanged(password: '')),
        skip: 0,
        wait: const Duration(milliseconds: 300),
        expect: <SignInState>[
          SignInState.empty(),
          SignInState.empty(isPasswordValid: false)
        ],
      );

      blocTest<SignInBloc, SignInEvent, SignInState>(
        'valid password',
        build: () async => SignInBloc(
          authRepository: authRepositoryMock,
          analyticsService: analyticsServiceMock,
        ),
        act: (SignInBloc bloc) async =>
            bloc.add(const SignInEvent.passwordChanged(password: '12345')),
        skip: 0,
        wait: const Duration(milliseconds: 300),
        expect: <SignInState>[SignInState.empty()],
      );
    });

    group('SignInWithEmailAndPassword event:', () {
      blocTest<SignInBloc, SignInEvent, SignInState>(
        'successful login',
        build: () async {
          when(authRepositoryMock.signInWithEmailAndPassword(
            email: kMockEmail,
            password: kMockPassword,
          )).thenAnswer((_) {
            return Future<FirebaseUser>.value(authenticatedUser);
          });
          return SignInBloc(
            authRepository: authRepositoryMock,
            analyticsService: analyticsServiceMock,
          );
        },
        act: (SignInBloc bloc) async =>
            bloc.add(const SignInEvent.emailAndPasswordPressed(
          email: kMockEmail,
          password: kMockPassword,
        )),
        expect: <SignInState>[
          SignInState.signingIn(),
          SignInState.success(user: authenticatedUser)
        ],
      );

      blocTest<SignInBloc, SignInEvent, SignInState>(
        'exception thrown by authentication repository',
        build: () async {
          when(authRepositoryMock.signInWithEmailAndPassword(
            email: kMockEmail,
            password: kMockPassword,
          )).thenThrow(exception);
          return SignInBloc(
            authRepository: authRepositoryMock,
            analyticsService: analyticsServiceMock,
          );
        },
        act: (SignInBloc bloc) async =>
            bloc.add(const SignInEvent.emailAndPasswordPressed(
          email: kMockEmail,
          password: kMockPassword,
        )),
        expect: <SignInState>[
          SignInState.signingIn(),
          SignInState.failure(exceptionRaised: exception)
        ],
      );
    });

    group('SignInWithGooglePressed event:', () {
      blocTest<SignInBloc, SignInEvent, SignInState>(
        'successful login',
        build: () async {
          when(authRepositoryMock.signInWithGoogle(
            newUserHandler: captureAnyNamed('newUserHandler'),
          )).thenAnswer((_) {
            return Future<FirebaseUser>.value(authenticatedUser);
          });
          return SignInBloc(
            authRepository: authRepositoryMock,
            analyticsService: analyticsServiceMock,
          );
        },
        act: (SignInBloc bloc) async => bloc.add(const SignInEvent.googlePressed()),
        expect: <SignInState>[SignInState.success(user: authenticatedUser)],
      );

      blocTest<SignInBloc, SignInEvent, SignInState>(
        'exception thrown by authentication repository',
        build: () async {
          when(authRepositoryMock.signInWithGoogle(
            newUserHandler: captureAnyNamed('newUserHandler'),
          )).thenThrow(exception);
          return SignInBloc(
            authRepository: authRepositoryMock,
            analyticsService: analyticsServiceMock,
          );
        },
        act: (SignInBloc bloc) async => bloc.add(const SignInEvent.googlePressed()),
        expect: <SignInState>[
          SignInState.failure(exceptionRaised: AppException.from(exception))
        ],
      );
    });
  });
}
