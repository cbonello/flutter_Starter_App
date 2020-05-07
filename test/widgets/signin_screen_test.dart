import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/src/blocs/authentication/authentication_bloc.dart';
import 'package:flutter_auth/src/configuration.dart';
import 'package:flutter_auth/src/keys.dart';
import 'package:flutter_auth/src/repositories/authentication_repository.dart';
import 'package:flutter_auth/src/services/analytics.dart';
import 'package:flutter_auth/src/services/local_storage.dart';
import 'package:flutter_auth/src/ui/common/index.dart';
import 'package:flutter_auth/src/ui/signin/screen.dart';
import 'package:flutter_auth/src/utils/app_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../mock/firebase_auth.dart';
import '../mock/repositories.dart';
import '../mock/services.dart';

const String kMockEmail = 'john.doe@yahoo.com';
const String kMockPassword = 'password1234';

void main() {
  final LocalStorageService localStorageServiceMock = MockLocalStorageService();
  final AuthenticationRepository authRepositoryMock = MockAuthenticationRepository();
  final AnalyticsService analyticsServiceMock = MockAnalyticsService();
  final FirebaseUser authenticatedUser = MockFirebaseUser();

  group('Sign-in screen', () {
    testWidgets(
      'sign-in button should be disabled by default',
      (WidgetTester tester) async {
        await tester.pumpWidget(
          MultiBlocProvider(
            providers: <BlocProvider<dynamic>>[
              BlocProvider<AuthenticationBloc>(
                create: (BuildContext _) {
                  return AuthenticationBloc(
                    localStorageService: localStorageServiceMock,
                    authRepository: authRepositoryMock,
                    analyticsService: analyticsServiceMock,
                  );
                },
              ),
            ],
            child: MaterialApp(
              localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
                AppLocalizationsDelegate(),
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: kSupportedLanguages,
              home: SignInScreen(
                authRepository: authRepositoryMock,
                analyticsService: analyticsServiceMock,
              ),
            ),
          ),
        );
        await tester.pumpAndSettle();

        final Finder submitButton = find.byKey(AppWidgetKeys.keys['SignInSubmitButton']);
        expect(submitButton, findsOneWidget);
        expect(tester.widget<GradientButton>(submitButton).enabled, isFalse);
      },
    );

    testWidgets(
      'sign-in button should be enabled when email and password fields are set',
      (WidgetTester tester) async {
        await tester.pumpWidget(
          MultiBlocProvider(
            providers: <BlocProvider<dynamic>>[
              BlocProvider<AuthenticationBloc>(
                create: (BuildContext _) {
                  return AuthenticationBloc(
                    localStorageService: localStorageServiceMock,
                    authRepository: authRepositoryMock,
                    analyticsService: analyticsServiceMock,
                  );
                },
              ),
            ],
            child: MaterialApp(
              localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
                AppLocalizationsDelegate(),
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: kSupportedLanguages,
              home: SignInScreen(
                authRepository: authRepositoryMock,
                analyticsService: analyticsServiceMock,
              ),
            ),
          ),
        );
        await tester.pumpAndSettle();

        await tester.enterText(
          find.byKey(AppWidgetKeys.keys['SignInEmailField']),
          kMockEmail,
        );
        await tester.enterText(
          find.byKey(AppWidgetKeys.keys['SignInPasswordField']),
          kMockPassword,
        );
        await tester.pumpAndSettle();

        final Finder submitButton = find.byKey(AppWidgetKeys.keys['SignInSubmitButton']);
        expect(submitButton, findsOneWidget);
        expect(tester.widget<GradientButton>(submitButton).enabled, isTrue);
      },
    );

    testWidgets(
      'home screen should be displayed after a ssuccessful sign-ins',
      (WidgetTester tester) async {
        when(authRepositoryMock.signInWithCurrentUser()).thenAnswer((_) => null);
        when(localStorageServiceMock.setAuthenticatedUserID(any)).thenAnswer((_) {
          return Future<bool>.value(true);
        });

        when(authRepositoryMock.signInWithEmailAndPassword(
          email: kMockEmail,
          password: kMockPassword,
        )).thenAnswer((_) {
          return Future<FirebaseUser>.value(authenticatedUser);
        });

        await tester.pumpWidget(
          MultiBlocProvider(
            providers: <BlocProvider<dynamic>>[
              BlocProvider<AuthenticationBloc>(
                create: (BuildContext _) {
                  return AuthenticationBloc(
                    localStorageService: localStorageServiceMock,
                    authRepository: authRepositoryMock,
                    analyticsService: analyticsServiceMock,
                  );
                },
              ),
            ],
            child: MaterialApp(
              localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
                AppLocalizationsDelegate(),
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: kSupportedLanguages,
              home: SignInScreen(
                authRepository: authRepositoryMock,
                analyticsService: analyticsServiceMock,
              ),
            ),
          ),
        );
        await tester.pumpAndSettle();

        await tester.enterText(
          find.byKey(AppWidgetKeys.keys['SignInEmailField']),
          kMockEmail,
        );
        await tester.enterText(
          find.byKey(AppWidgetKeys.keys['SignInPasswordField']),
          kMockPassword,
        );
        await tester.pumpAndSettle();

        await tester.tap(find.byKey(AppWidgetKeys.keys['SignInSubmitButton']));
        await tester.pumpAndSettle();

        // final Finder signOutButton = find.byKey(AppWidgetKeys.keys['HomeSignOutButton']);
        // expect(signOutButton, findsOneWidget);
      },
    );

    testWidgets(
      'pressing the "Forgot Password" button should display the Reset Password screen',
      (WidgetTester tester) async {
        await tester.pumpWidget(
          MultiBlocProvider(
            providers: <BlocProvider<dynamic>>[
              BlocProvider<AuthenticationBloc>(
                create: (BuildContext _) {
                  return AuthenticationBloc(
                    localStorageService: localStorageServiceMock,
                    authRepository: authRepositoryMock,
                    analyticsService: analyticsServiceMock,
                  );
                },
              ),
            ],
            child: MaterialApp(
              localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
                AppLocalizationsDelegate(),
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: kSupportedLanguages,
              home: SignInScreen(
                authRepository: authRepositoryMock,
                analyticsService: analyticsServiceMock,
              ),
            ),
          ),
        );
        await tester.pumpAndSettle();

        await tester.tap(find.byKey(AppWidgetKeys.keys['SignInForgotPasswordButton']));
        await tester.pumpAndSettle();

        final Finder submitButton = find.byKey(
          AppWidgetKeys.keys['PasswordResetSubmitButton'],
        );
        expect(submitButton, findsOneWidget);
      },
    );

    testWidgets(
      'pressing the "Sign-Up" button should display the Sign-Up screen',
      (WidgetTester tester) async {
        await tester.pumpWidget(
          MultiBlocProvider(
            providers: <BlocProvider<dynamic>>[
              BlocProvider<AuthenticationBloc>(
                create: (BuildContext _) {
                  return AuthenticationBloc(
                    localStorageService: localStorageServiceMock,
                    authRepository: authRepositoryMock,
                    analyticsService: analyticsServiceMock,
                  );
                },
              ),
            ],
            child: MaterialApp(
              localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
                AppLocalizationsDelegate(),
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: kSupportedLanguages,
              home: SignInScreen(
                authRepository: authRepositoryMock,
                analyticsService: analyticsServiceMock,
              ),
            ),
          ),
        );
        await tester.pumpAndSettle();

        await tester.tap(find.byKey(AppWidgetKeys.keys['SignInSignUpButton']));
        await tester.pumpAndSettle();

        final Finder submitButton = find.byKey(AppWidgetKeys.keys['SignUpSubmitButton']);
        expect(submitButton, findsOneWidget);
      },
    );
  });
}
