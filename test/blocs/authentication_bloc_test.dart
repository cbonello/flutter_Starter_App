import 'package:bloc_test/bloc_test.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:starter_app/src/blocs/authentication/authentication_bloc.dart';
import 'package:starter_app/src/repositories/authentication_repository.dart';
import 'package:starter_app/src/services/local_storage.dart';
import 'package:starter_app/src/utils/exceptions.dart';

import '../mock/firebase_auth.dart';
import '../mock/repositories.dart';
import '../mock/services.dart';

Future<void> main() async {
  group('Authentication Bloc:', () {
    final LocalStorageService localStorageServiceMock = MockLocalStorageService();
    final AuthenticationRepository authRepositoryMock = MockAuthenticationRepository();
    final FirebaseAnalytics firebaseAnalyticsMock = MockFirebaseAnalytics();
    final FirebaseUser authenticatedUser = MockFirebaseUser();
    final AppException exception = AppException.fromCode('ERROR_SiGN_IN_CANCEL');

    group('Initialization:', () {
      blocTest<AuthenticationBloc, AuthenticationEvent, AuthenticationState>(
        'initial state is AuthenticationState.uninitialized()',
        build: () async => AuthenticationBloc(
          localStorageService: localStorageServiceMock,
          authRepository: authRepositoryMock,
          firebaseAnalytics: firebaseAnalyticsMock,
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
            firebaseAnalytics: firebaseAnalyticsMock,
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
          when(firebaseAnalyticsMock.logLogin()).thenAnswer((_) {
            return;
          });
          return AuthenticationBloc(
            localStorageService: localStorageServiceMock,
            authRepository: authRepositoryMock,
            firebaseAnalytics: firebaseAnalyticsMock,
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
            firebaseAnalytics: firebaseAnalyticsMock,
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
            firebaseAnalytics: firebaseAnalyticsMock,
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
            firebaseAnalytics: firebaseAnalyticsMock,
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
