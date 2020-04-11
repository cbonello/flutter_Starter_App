import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:starter_app/src/blocs/reset_password/reset_password_bloc.dart';
import 'package:starter_app/src/repositories/authentication_repository.dart';
import 'package:starter_app/src/utils/exceptions.dart';

import '../mock/repositories.dart';

const String kMockEmail = 'john.doe@yahoo.com';

Future<void> main() async {
  group('ResetPassword Bloc:', () {
    final AuthenticationRepository authRepositoryMock = MockAuthenticationRepository();
    final AppException exception = AppException.fromCode('ERROR_SiGN_IN_CANCEL');

    group('Initialization:', () {
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
        build: () async => ResetPasswordBloc(authRepository: authRepositoryMock)
          ..add(const ResetPasswordEvent.emailChanged(email: 'abcd')),
        act: (ResetPasswordBloc bloc) async {
          bloc.add(const ResetPasswordEvent.emailChanged(email: 'abcd@'));
        },
        skip: 0,
        wait: const Duration(milliseconds: 300),
        expect: <ResetPasswordState>[
          ResetPasswordState.empty(),
          ResetPasswordState.empty(isEmailValid: false, email: 'abcd@'),
        ],
      );

      blocTest<ResetPasswordBloc, ResetPasswordEvent, ResetPasswordState>(
        'valid email',
        build: () async => ResetPasswordBloc(authRepository: authRepositoryMock),
        act: (ResetPasswordBloc bloc) async =>
            bloc.add(const ResetPasswordEvent.emailChanged(email: kMockEmail)),
        skip: 0,
        wait: const Duration(milliseconds: 300),
        expect: <ResetPasswordState>[
          ResetPasswordState.empty(),
          ResetPasswordState.empty(email: kMockEmail),
        ],
      );
    });

    group('ResetPressed event:', () {
      blocTest<ResetPasswordBloc, ResetPasswordEvent, ResetPasswordState>(
        'successful reset',
        build: () async => ResetPasswordBloc(authRepository: authRepositoryMock),
        act: (ResetPasswordBloc bloc) async =>
            bloc.add(const ResetPasswordEvent.resetPressed(email: kMockEmail)),
        expect: <ResetPasswordState>[ResetPasswordState.success(email: kMockEmail)],
      );

      blocTest<ResetPasswordBloc, ResetPasswordEvent, ResetPasswordState>(
        'exception thrown by authentication repository',
        build: () async {
          when(authRepositoryMock.resetPassword(email: kMockEmail)).thenThrow(exception);
          return ResetPasswordBloc(authRepository: authRepositoryMock);
        },
        act: (ResetPasswordBloc bloc) async =>
            bloc.add(const ResetPasswordEvent.resetPressed(email: kMockEmail)),
        expect: <ResetPasswordState>[
          ResetPasswordState.failure(exceptionRaised: exception)
        ],
      );
    });
  });
}
