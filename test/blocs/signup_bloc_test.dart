import 'package:bloc_test/bloc_test.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:flutter_starter_app/src/blocs/blocs.dart';
import 'package:flutter_starter_app/src/repositories/repositories.dart';
import 'package:flutter_starter_app/src/utils/utils.dart';

import '../mock/firebase_auth.dart';
import '../mock/repositories.dart';

const String kMockInvalidEmail = 'john.doe@ya';
const String kMockValidEmail = 'john.doe@yahoo.com';
const String kMockPassword = 'password1234';

Future<void> main() async {
  group('SignUp Bloc:', () {
    final AuthenticationRepository authRepositoryMock = MockAuthenticationRepository();
    final FirebaseUser authenticatedUser = MockFirebaseUser();
    const AppException exception = AppException(code: 'ERROR_SiGN_IN_CANCEL');

    group('Initialization:', () {
      test('should throw an assertion error for invalid args', () {
        expect(() => SignUpBloc(authRepository: null), throwsAssertionError);
      });

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
        build: () async => SignUpBloc(authRepository: authRepositoryMock),
        act: (SignUpBloc bloc) async {
          bloc.add(const SignUpEvent.emailChanged(email: kMockInvalidEmail));
        },
        skip: 0,
        expect: <SignUpState>[
          SignUpState.empty(),
          const SignUpState(email: kMockInvalidEmail),
        ],
        verify: (SignUpBloc bloc) async {
          expect(bloc.state.isValidEmail(), false);
          expect(bloc.state.isValidPassword(), false);
        },
      );

      blocTest<SignUpBloc, SignUpEvent, SignUpState>(
        'valid email',
        build: () async => SignUpBloc(authRepository: authRepositoryMock),
        act: (SignUpBloc bloc) async {
          bloc.add(const SignUpEvent.emailChanged(email: kMockValidEmail));
        },
        skip: 0,
        expect: <SignUpState>[
          SignUpState.empty(),
          const SignUpState(email: kMockValidEmail),
        ],
        verify: (SignUpBloc bloc) async {
          expect(bloc.state.isValidEmail(), true);
          expect(bloc.state.isValidPassword(), false);
        },
      );
    });

    group('PasswordChanged:', () {
      blocTest<SignUpBloc, SignUpEvent, SignUpState>(
        'invalid password',
        build: () async => SignUpBloc(authRepository: authRepositoryMock),
        act: (SignUpBloc bloc) async {
          bloc.add(const SignUpEvent.passwordChanged(password: ''));
        },
        skip: 0,
        expect: <SignUpState>[SignUpState.empty()],
        verify: (SignUpBloc bloc) async {
          expect(bloc.state.isValidEmail(), false);
          expect(bloc.state.isValidPassword(), false);
        },
      );

      blocTest<SignUpBloc, SignUpEvent, SignUpState>(
        'valid password',
        build: () async => SignUpBloc(authRepository: authRepositoryMock),
        act: (SignUpBloc bloc) async {
          bloc.add(const SignUpEvent.passwordChanged(password: kMockPassword));
        },
        skip: 0,
        expect: <SignUpState>[
          SignUpState.empty(),
          const SignUpState(password: kMockPassword),
        ],
        verify: (SignUpBloc bloc) async {
          expect(bloc.state.isValidEmail(), false);
          expect(bloc.state.isValidPassword(), true);
        },
      );
    });

    group('tosChanged:', () {
      blocTest<SignUpBloc, SignUpEvent, SignUpState>(
        'toggle ToS acceptance',
        build: () async => SignUpBloc(authRepository: authRepositoryMock),
        act: (SignUpBloc bloc) async {
          bloc.add(const SignUpEvent.tosChanged(tos: true));
          bloc.add(const SignUpEvent.tosChanged(tos: false));
        },
        skip: 0,
        expect: <SignUpState>[
          SignUpState.empty(),
          const SignUpState(tosAccepted: true),
          const SignUpState(tosAccepted: false),
        ],
      );
    });

    group('Submitted event:', () {
      blocTest<SignUpBloc, SignUpEvent, SignUpState>(
        'Sign up successfully',
        build: () async {
          when(authRepositoryMock.signUp(
            email: kMockValidEmail,
            password: kMockPassword,
          )).thenAnswer((_) {
            return Future<FirebaseUser>.value(authenticatedUser);
          });
          return SignUpBloc(authRepository: authRepositoryMock);
        },
        act: (SignUpBloc bloc) async {
          bloc.add(const SignUpEvent.emailChanged(email: kMockValidEmail));
          bloc.add(const SignUpEvent.passwordChanged(password: kMockPassword));
          bloc.add(const SignUpEvent.tosChanged(tos: true));
          bloc.add(const SignUpEvent.submitted());
        },
        skip: 0,
        expect: <SignUpState>[
          SignUpState.empty(),
          const SignUpState(email: kMockValidEmail),
          const SignUpState(email: kMockValidEmail, password: kMockPassword),
          const SignUpState(
            email: kMockValidEmail,
            password: kMockPassword,
            tosAccepted: true,
          ),
          const SignUpState(
            email: kMockValidEmail,
            password: kMockPassword,
            tosAccepted: true,
            isSubmitting: true,
          ),
          const SignUpState(
            email: kMockValidEmail,
            password: kMockPassword,
            tosAccepted: true,
            isSubmitting: false,
            isVerificationEmailSent: true,
          ),
        ],
      );

      blocTest<SignUpBloc, SignUpEvent, SignUpState>(
        'Sign up (exception thrown by authentication repository)',
        build: () async {
          when(authRepositoryMock.signUp(
            email: anyNamed('email'),
            password: anyNamed('password'),
          )).thenThrow(exception);
          return SignUpBloc(authRepository: authRepositoryMock);
        },
        act: (SignUpBloc bloc) async {
          bloc.add(const SignUpEvent.emailChanged(email: kMockValidEmail));
          bloc.add(const SignUpEvent.passwordChanged(password: kMockPassword));
          bloc.add(const SignUpEvent.tosChanged(tos: true));
          bloc.add(const SignUpEvent.submitted());
        },
        skip: 0,
        expect: <SignUpState>[
          SignUpState.empty(),
          const SignUpState(email: kMockValidEmail),
          const SignUpState(email: kMockValidEmail, password: kMockPassword),
          const SignUpState(
            email: kMockValidEmail,
            password: kMockPassword,
            tosAccepted: true,
          ),
          const SignUpState(
            email: kMockValidEmail,
            password: kMockPassword,
            tosAccepted: true,
            isSubmitting: true,
          ),
          const SignUpState(
            email: kMockValidEmail,
            password: kMockPassword,
            tosAccepted: true,
            isSubmitting: false,
            exceptionRaised: exception,
          ),
        ],
      );
    });
  });
}
