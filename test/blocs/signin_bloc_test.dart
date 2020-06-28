import 'package:bloc_test/bloc_test.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:flutter_starter_app/src/blocs/blocs.dart';
import 'package:flutter_starter_app/src/repositories/repositories.dart';
import 'package:flutter_starter_app/src/services/services.dart';
import 'package:flutter_starter_app/src/utils/utils.dart';

import '../mock/firebase_auth.dart';
import '../mock/repositories.dart';
import '../mock/services.dart';

const String kMockInvalidEmail = 'john.doe@ya';
const String kMockValidEmail = 'john.doe@yahoo.com';
const String kMockPassword = 'password1234';

Future<void> main() async {
  group('SignIn Bloc:', () {
    final AuthenticationRepository authRepositoryMock = MockAuthenticationRepository();
    final AnalyticsService analyticsServiceMock = MockAnalyticsService();
    final FirebaseUser authenticatedUser = MockFirebaseUser();
    const AppException exception = AppException(code: 'ERROR_EMAIL_NOT_VERIFIED');

    group('Initialization:', () {
      test('should throw an assertion error for invalid args', () {
        expect(
          () => SignInBloc(authRepository: null, analyticsService: analyticsServiceMock),
          throwsAssertionError,
        );
        expect(
          () => SignInBloc(authRepository: authRepositoryMock, analyticsService: null),
          throwsAssertionError,
        );
      });

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
        ),
        act: (SignInBloc bloc) async {
          bloc.add(const SignInEvent.emailChanged(email: kMockInvalidEmail));
        },
        skip: 0,
        expect: <SignInState>[
          SignInState.empty(),
          const SignInState(email: kMockInvalidEmail),
        ],
        verify: (SignInBloc bloc) async {
          expect(bloc.state.isValidEmail(), false);
          expect(bloc.state.isValidPassword(), false);
        },
      );

      blocTest<SignInBloc, SignInEvent, SignInState>(
        'valid email',
        build: () async => SignInBloc(
          authRepository: authRepositoryMock,
          analyticsService: analyticsServiceMock,
        ),
        act: (SignInBloc bloc) async {
          bloc.add(const SignInEvent.emailChanged(email: kMockValidEmail));
        },
        skip: 0,
        expect: <SignInState>[
          SignInState.empty(),
          const SignInState(email: kMockValidEmail),
        ],
        verify: (SignInBloc bloc) async {
          expect(bloc.state.isValidEmail(), true);
          expect(bloc.state.isValidPassword(), false);
        },
      );
    });

    group('PasswordChanged:', () {
      blocTest<SignInBloc, SignInEvent, SignInState>(
        'invalid password',
        build: () async => SignInBloc(
          authRepository: authRepositoryMock,
          analyticsService: analyticsServiceMock,
        ),
        act: (SignInBloc bloc) async {
          bloc.add(const SignInEvent.passwordChanged(password: ''));
        },
        skip: 0,
        expect: <SignInState>[SignInState.empty()],
        verify: (SignInBloc bloc) async {
          expect(bloc.state.isValidEmail(), false);
          expect(bloc.state.isValidPassword(), false);
        },
      );

      blocTest<SignInBloc, SignInEvent, SignInState>(
        'valid password',
        build: () async => SignInBloc(
          authRepository: authRepositoryMock,
          analyticsService: analyticsServiceMock,
        ),
        act: (SignInBloc bloc) async {
          bloc.add(const SignInEvent.passwordChanged(password: kMockPassword));
        },
        skip: 0,
        expect: <SignInState>[
          SignInState.empty(),
          const SignInState(password: kMockPassword),
        ],
        verify: (SignInBloc bloc) async {
          expect(bloc.state.isValidEmail(), false);
          expect(bloc.state.isValidPassword(), true);
        },
      );
    });

    group('SignInWithEmailAndPassword event:', () {
      blocTest<SignInBloc, SignInEvent, SignInState>(
        'successful login',
        build: () async {
          when(authRepositoryMock.signInWithEmailAndPassword(
            email: kMockValidEmail,
            password: kMockPassword,
          )).thenAnswer((_) {
            return Future<FirebaseUser>.value(authenticatedUser);
          });
          return SignInBloc(
            authRepository: authRepositoryMock,
            analyticsService: analyticsServiceMock,
          );
        },
        act: (SignInBloc bloc) async {
          bloc.add(const SignInEvent.emailChanged(email: kMockValidEmail));
          bloc.add(const SignInEvent.passwordChanged(password: kMockPassword));
          bloc.add(const SignInEvent.emailAndPasswordPressed());
        },
        skip: 0,
        expect: <SignInState>[
          SignInState.empty(),
          const SignInState(email: kMockValidEmail),
          const SignInState(email: kMockValidEmail, password: kMockPassword),
          const SignInState(
            email: kMockValidEmail,
            password: kMockPassword,
            isSubmitting: true,
          ),
          SignInState(
            email: kMockValidEmail,
            password: kMockPassword,
            user: authenticatedUser,
          ),
        ],
      );

      blocTest<SignInBloc, SignInEvent, SignInState>(
        'exception thrown by authentication repository',
        build: () async {
          when(authRepositoryMock.signInWithEmailAndPassword(
            email: anyNamed('email'),
            password: anyNamed('password'),
          )).thenThrow(exception);
          return SignInBloc(
            authRepository: authRepositoryMock,
            analyticsService: analyticsServiceMock,
          );
        },
        act: (SignInBloc bloc) async {
          bloc.add(const SignInEvent.emailChanged(email: kMockValidEmail));
          bloc.add(const SignInEvent.passwordChanged(password: kMockPassword));
          bloc.add(const SignInEvent.emailAndPasswordPressed());
        },
        skip: 0,
        expect: <SignInState>[
          SignInState.empty(),
          const SignInState(email: kMockValidEmail),
          const SignInState(email: kMockValidEmail, password: kMockPassword),
          const SignInState(
            email: kMockValidEmail,
            password: kMockPassword,
            isSubmitting: true,
          ),
          const SignInState(
            email: kMockValidEmail,
            password: kMockPassword,
            user: null,
            exceptionRaised: exception,
          ),
        ],
      );
    });

    group('SignInWithGooglePressed event:', () {
      blocTest<SignInBloc, SignInEvent, SignInState>(
        'successful login',
        build: () async {
          when(authRepositoryMock.signInWithGoogle(
            newUserHandler: anyNamed('newUserHandler'),
          )).thenAnswer((_) {
            return Future<FirebaseUser>.value(authenticatedUser);
          });
          return SignInBloc(
            authRepository: authRepositoryMock,
            analyticsService: analyticsServiceMock,
          );
        },
        act: (SignInBloc bloc) async => bloc.add(const SignInEvent.googlePressed()),
        skip: 0,
        expect: <SignInState>[
          SignInState.empty(),
          SignInState(user: authenticatedUser),
        ],
      );

      blocTest<SignInBloc, SignInEvent, SignInState>(
        'exception thrown by authentication repository',
        build: () async {
          when(authRepositoryMock.signInWithGoogle(
            newUserHandler: anyNamed('newUserHandler'),
          )).thenThrow(exception);
          return SignInBloc(
            authRepository: authRepositoryMock,
            analyticsService: analyticsServiceMock,
          );
        },
        act: (SignInBloc bloc) async => bloc.add(const SignInEvent.googlePressed()),
        wait: const Duration(milliseconds: 500),
        skip: 0,
        expect: <SignInState>[
          SignInState.empty(),
          const SignInState(exceptionRaised: exception),
        ],
      );
    });
  });
}
