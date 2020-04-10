import 'package:bloc_test/bloc_test.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:starter_app/src/blocs/signin/signin_bloc.dart';
import 'package:starter_app/src/repositories/authentication_repository.dart';
import 'package:starter_app/src/utils/exceptions.dart';

import '../mock/firebase_auth.dart';
import '../mock/repositories.dart';

const String MOCK_EMAIL = 'john.doe@yahoo.com';
const String MOCK_PASSWORD = 'password1234';

Future<void> main() async {
  group('SignIn Bloc:', () {
    final AuthenticationRepository authRepositoryMock = MockAuthenticationRepository();
    final FirebaseUser authenticatedUser = MockFirebaseUser();
    final AppException exception = AppException.fromCode('ERROR_SiGN_IN_CANCEL');

    group('Initialization:', () {
      blocTest<SignInBloc, SignInEvent, SignInState>(
        'initial state is SignInState.empty()',
        build: () async => SignInBloc(authRepository: authRepositoryMock),
        skip: 0,
        expect: <SignInState>[SignInState.empty()],
      );
    });

    group('EmailChanged:', () {
      blocTest<SignInBloc, SignInEvent, SignInState>(
        'invalid email',
        build: () async => SignInBloc(authRepository: authRepositoryMock)
          ..add(const SignInEvent.emailChanged(email: 'abcd')),
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
        build: () async => SignInBloc(authRepository: authRepositoryMock),
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
        build: () async => SignInBloc(authRepository: authRepositoryMock),
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
        build: () async => SignInBloc(authRepository: authRepositoryMock),
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
            email: MOCK_EMAIL,
            password: MOCK_PASSWORD,
          )).thenAnswer((_) {
            return Future<FirebaseUser>.value(authenticatedUser);
          });
          return SignInBloc(authRepository: authRepositoryMock);
        },
        act: (SignInBloc bloc) async =>
            bloc.add(const SignInEvent.emailAndPasswordPressed(
          email: MOCK_EMAIL,
          password: MOCK_PASSWORD,
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
            email: MOCK_EMAIL,
            password: MOCK_PASSWORD,
          ))
            ..thenThrow(exception);
          return SignInBloc(authRepository: authRepositoryMock);
        },
        act: (SignInBloc bloc) async =>
            bloc.add(const SignInEvent.emailAndPasswordPressed(
          email: MOCK_EMAIL,
          password: MOCK_PASSWORD,
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
          return SignInBloc(authRepository: authRepositoryMock);
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
          return SignInBloc(authRepository: authRepositoryMock);
        },
        act: (SignInBloc bloc) async => bloc.add(const SignInEvent.googlePressed()),
        expect: <SignInState>[
          SignInState.failure(exceptionRaised: AppException.from(exception))
        ],
      );
    });
  });
}
