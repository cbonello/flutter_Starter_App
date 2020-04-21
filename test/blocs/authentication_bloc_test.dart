import 'package:bloc_test/bloc_test.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:flutter_auth/src/blocs/authentication/authentication_bloc.dart';
import 'package:flutter_auth/src/repositories/authentication_repository.dart';
import 'package:flutter_auth/src/services/analytics.dart';
import 'package:flutter_auth/src/services/local_storage.dart';
import 'package:flutter_auth/src/utils/exceptions.dart';

import '../mock/firebase_auth.dart';
import '../mock/repositories.dart';
import '../mock/services.dart';

Future<void> main() async {
  group('Authentication Bloc:', () {
    final LocalStorageService localStorageServiceMock = MockLocalStorageService();
    final AuthenticationRepository authRepositoryMock = MockAuthenticationRepository();
    final AnalyticsService analyticsServiceMock = MockAnalyticsService();
    final FirebaseUser authenticatedUser = MockFirebaseUser();
    const AppException exception = AppException(code: 'ERROR_SiGN_IN_CANCEL');

    group('Initialization:', () {
      blocTest<AuthenticationBloc, AuthenticationEvent, AuthenticationState>(
        'initial state is AuthenticationState.uninitialized()',
        build: () async => AuthenticationBloc(
          localStorageService: localStorageServiceMock,
          authRepository: authRepositoryMock,
          analyticsService: analyticsServiceMock,
        ),
        skip: 0,
        expect: <AuthenticationState>[const AuthenticationState.uninitialized()],
      );
    });

    group('AppStarted event:', () {
      blocTest<AuthenticationBloc, AuthenticationEvent, AuthenticationState>(
        'no user signed in',
        build: () async {
          when(authRepositoryMock.signInWithCurrentUser()).thenAnswer((_) => null);
          return AuthenticationBloc(
            localStorageService: localStorageServiceMock,
            authRepository: authRepositoryMock,
            analyticsService: analyticsServiceMock,
          )..add(const AuthenticationEvent.appStarted());
        },
        expect: <AuthenticationState>[
          const AuthenticationState.unauthenticated(),
        ],
      );

      blocTest<AuthenticationBloc, AuthenticationEvent, AuthenticationState>(
        'authenticate with user currently signed in',
        build: () async {
          when(authRepositoryMock.signInWithCurrentUser()).thenAnswer((_) {
            return Future<FirebaseUser>.value(authenticatedUser);
          });
          when(localStorageServiceMock.setAuthenticatedUserID(any)).thenAnswer((_) {
            return Future<bool>.value(true);
          });
          return AuthenticationBloc(
            localStorageService: localStorageServiceMock,
            authRepository: authRepositoryMock,
            analyticsService: analyticsServiceMock,
          )..add(const AuthenticationEvent.appStarted());
        },
        expect: <AuthenticationState>[
          AuthenticationState.authenticated(authenticatedUser: authenticatedUser),
        ],
      );

      blocTest<AuthenticationBloc, AuthenticationEvent, AuthenticationState>(
        'exception thrown by authentication repository',
        build: () async {
          when(authRepositoryMock.signInWithCurrentUser()).thenThrow(exception);
          return AuthenticationBloc(
            localStorageService: localStorageServiceMock,
            authRepository: authRepositoryMock,
            analyticsService: analyticsServiceMock,
          )..add(const AuthenticationEvent.appStarted());
        },
        expect: <AuthenticationState>[
          const AuthenticationState.unauthenticated(),
        ],
      );
    });

    group('SignedIn event:', () {
      blocTest<AuthenticationBloc, AuthenticationEvent, AuthenticationState>(
        'a user signed in',
        build: () async {
          when(authRepositoryMock.signInWithCurrentUser()).thenAnswer((_) => null);
          when(localStorageServiceMock.setAuthenticatedUserID(any)).thenAnswer((_) {
            return Future<bool>.value(true);
          });
          return AuthenticationBloc(
            localStorageService: localStorageServiceMock,
            authRepository: authRepositoryMock,
            analyticsService: analyticsServiceMock,
          )
            ..add(const AuthenticationEvent.appStarted())
            ..add(AuthenticationEvent.signedIn(user: authenticatedUser));
        },
        expect: <AuthenticationState>[
          const AuthenticationState.unauthenticated(),
          AuthenticationState.authenticated(authenticatedUser: authenticatedUser)
        ],
      );
    });

    group('SignedOut event:', () {
      blocTest<AuthenticationBloc, AuthenticationEvent, AuthenticationState>(
        'a user signed out',
        build: () async {
          when(authRepositoryMock.signInWithCurrentUser()).thenAnswer((_) => null);
          when(localStorageServiceMock.setAuthenticatedUserID(any)).thenAnswer((_) {
            return Future<bool>.value(true);
          });
          return AuthenticationBloc(
            localStorageService: localStorageServiceMock,
            authRepository: authRepositoryMock,
            analyticsService: analyticsServiceMock,
          )
            ..add(const AuthenticationEvent.appStarted())
            ..add(AuthenticationEvent.signedIn(user: authenticatedUser))
            ..add(const AuthenticationEvent.signedOut());
        },
        expect: <AuthenticationState>[
          const AuthenticationState.unauthenticated(),
          AuthenticationState.authenticated(authenticatedUser: authenticatedUser),
          const AuthenticationState.unauthenticated()
        ],
      );
    });
  });
}
