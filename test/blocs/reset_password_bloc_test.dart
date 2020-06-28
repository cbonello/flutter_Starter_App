import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:flutter_starter_app/src/blocs/blocs.dart';
import 'package:flutter_starter_app/src/repositories/repositories.dart';
import 'package:flutter_starter_app/src/utils/utils.dart';

import '../mock/repositories.dart';

const String kMockInvalidEmail = 'john.doe@ya';
const String kMockValidEmail = 'john.doe@yahoo.com';
const String kMockPassword = 'password1234';

Future<void> main() async {
  group('ResetPassword Bloc:', () {
    final AuthenticationRepository authRepositoryMock = MockAuthenticationRepository();
    const AppException exception = AppException(code: 'ERROR_SiGN_IN_CANCEL');

    group('Initialization:', () {
      test('should throw an assertion error for invalid args', () {
        expect(() => ResetPasswordBloc(authRepository: null), throwsAssertionError);
      });

      blocTest<ResetPasswordBloc, ResetPasswordEvent, ResetPasswordState>(
        'initial state is ResetPasswordState.empty()',
        build: () async => ResetPasswordBloc(authRepository: authRepositoryMock),
        skip: 0,
        expect: <ResetPasswordState>[ResetPasswordState.empty()],
      );
    });

    group('EmailChanged:', () {
      blocTest<ResetPasswordBloc, ResetPasswordEvent, ResetPasswordState>(
        'invalid email',
        build: () async => ResetPasswordBloc(authRepository: authRepositoryMock),
        act: (ResetPasswordBloc bloc) async {
          bloc.add(const ResetPasswordEvent.emailChanged(email: kMockInvalidEmail));
        },
        skip: 0,
        expect: <ResetPasswordState>[
          ResetPasswordState.empty(),
          const ResetPasswordState(email: kMockInvalidEmail),
        ],
        verify: (ResetPasswordBloc bloc) async {
          expect(bloc.state.isValidEmail(), false);
        },
      );

      blocTest<ResetPasswordBloc, ResetPasswordEvent, ResetPasswordState>(
        'valid email',
        build: () async => ResetPasswordBloc(authRepository: authRepositoryMock),
        act: (ResetPasswordBloc bloc) async {
          bloc.add(const ResetPasswordEvent.emailChanged(email: kMockValidEmail));
        },
        skip: 0,
        expect: <ResetPasswordState>[
          ResetPasswordState.empty(),
          const ResetPasswordState(email: kMockValidEmail),
        ],
        verify: (ResetPasswordBloc bloc) async {
          expect(bloc.state.isValidEmail(), true);
        },
      );
    });

    group('ResetPressed event:', () {
      blocTest<ResetPasswordBloc, ResetPasswordEvent, ResetPasswordState>(
        'successful reset',
        build: () async => ResetPasswordBloc(authRepository: authRepositoryMock),
        act: (ResetPasswordBloc bloc) async {
          bloc.add(const ResetPasswordEvent.emailChanged(email: kMockValidEmail));
          bloc.add(const ResetPasswordEvent.resetPressed());
        },
        skip: 0,
        expect: <ResetPasswordState>[
          ResetPasswordState.empty(),
          const ResetPasswordState(email: kMockValidEmail),
          const ResetPasswordState(email: kMockValidEmail, isSubmitting: true),
          const ResetPasswordState(email: kMockValidEmail, isResetEmailSent: true),
        ],
      );

      blocTest<ResetPasswordBloc, ResetPasswordEvent, ResetPasswordState>(
        'exception thrown by authentication repository',
        build: () async {
          when(authRepositoryMock.sendPasswordResetEmail(
            email: anyNamed('email'),
          )).thenThrow(exception);
          return ResetPasswordBloc(authRepository: authRepositoryMock);
        },
        act: (ResetPasswordBloc bloc) async {
          bloc.add(const ResetPasswordEvent.emailChanged(email: kMockValidEmail));
          bloc.add(const ResetPasswordEvent.resetPressed());
        },
        skip: 0,
        expect: <ResetPasswordState>[
          ResetPasswordState.empty(),
          const ResetPasswordState(email: kMockValidEmail),
          const ResetPasswordState(email: kMockValidEmail, isSubmitting: true),
          const ResetPasswordState(email: kMockValidEmail, exceptionRaised: exception),
        ],
      );
    });
  });
}
