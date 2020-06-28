import 'package:bloc_test/bloc_test.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_starter_app/src/blocs/blocs.dart';
import 'package:flutter_starter_app/src/utils/utils.dart';
import 'package:flutter_starter_app/src/repositories/repositories.dart';
import 'package:flutter_starter_app/src/services/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../mock/mock.dart';

const String kUserId = 'user-id';

Future<void> main() async {
  TestWidgetsFlutterBinding.ensureInitialized();

  LocalStorageService localStorageService;
  final Map<String, dynamic> sharedPrefsStore = <String, dynamic>{};

  setUpAll(() async {
    const MethodChannel('plugins.flutter.io/shared_preferences')
        .setMockMethodCallHandler((MethodCall methodCall) async {
      if (methodCall.method == 'getAll') {
        return sharedPrefsStore;
      }
      return null;
    });
    localStorageService = await LocalStorageService.getInstance();
  });

  group('Authentication Bloc:', () {
    final AuthenticationRepository authRepositoryMock = MockAuthenticationRepository();
    final AnalyticsService analyticsServiceMock = MockAnalyticsService();
    final FirebaseUser authenticatedUser = MockFirebaseUser();
    const AppException exception = AppException(code: 'ERROR_SiGN_IN_CANCEL');

    group('Initialization:', () {
      test('should throw an assertion error for invalid args', () {
        expect(
          () => AuthenticationBloc(
            localStorageService: null,
            authRepository: authRepositoryMock,
            analyticsService: analyticsServiceMock,
          ),
          throwsAssertionError,
        );
        expect(
          () => AuthenticationBloc(
            localStorageService: localStorageService,
            authRepository: null,
            analyticsService: analyticsServiceMock,
          ),
          throwsAssertionError,
        );
        expect(
          () => AuthenticationBloc(
            localStorageService: localStorageService,
            authRepository: authRepositoryMock,
            analyticsService: null,
          ),
          throwsAssertionError,
        );
      });

      blocTest<AuthenticationBloc, AuthenticationEvent, AuthenticationState>(
        'initial state is AuthenticationState.uninitialized()',
        build: () async => AuthenticationBloc(
          localStorageService: localStorageService,
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
            localStorageService: localStorageService,
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
          when(authenticatedUser.uid).thenReturn(kUserId);
          return AuthenticationBloc(
            localStorageService: localStorageService,
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
            localStorageService: localStorageService,
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
          return AuthenticationBloc(
            localStorageService: localStorageService,
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
          return AuthenticationBloc(
            localStorageService: localStorageService,
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
