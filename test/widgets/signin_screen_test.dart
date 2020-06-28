import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starter_app/src/blocs/blocs.dart';
import 'package:flutter_starter_app/src/configuration.dart';
import 'package:flutter_starter_app/src/keys.dart';
import 'package:flutter_starter_app/src/repositories/repositories.dart';
import 'package:flutter_starter_app/src/services/services.dart';
import 'package:flutter_starter_app/src/ui/screens.dart';
import 'package:flutter_starter_app/src/utils/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../mock/firebase_auth.dart';
import '../mock/repositories.dart';
import '../mock/services.dart';

const String kMockValidEmail = 'john.doe@yahoo.com';
const String kMockInvalidEmail = 'john.doe';
const String kMockValidPassword = 'password1234';
const String kMockInvalidPassword = 'pass';

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
      'sign-in button should be disabled when an invalid email is entered',
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
          kMockInvalidEmail,
        );
        await tester.pumpAndSettle();

        final Finder submitButton = find.byKey(AppWidgetKeys.keys['SignInSubmitButton']);
        expect(submitButton, findsOneWidget);
        expect(tester.widget<GradientButton>(submitButton).enabled, isFalse);
      },
    );

    testWidgets(
      'sign-in button should be disabled when an invalid password is entered',
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
          find.byKey(AppWidgetKeys.keys['SignInPasswordField']),
          kMockInvalidPassword,
        );
        await tester.pumpAndSettle();

        final Finder submitButton = find.byKey(AppWidgetKeys.keys['SignInSubmitButton']);
        expect(submitButton, findsOneWidget);
        expect(tester.widget<GradientButton>(submitButton).enabled, isFalse);
      },
    );

    testWidgets(
      'sign-in button should be enabled when valid email and password are entered',
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
          kMockValidEmail,
        );
        await tester.enterText(
          find.byKey(AppWidgetKeys.keys['SignInPasswordField']),
          kMockValidPassword,
        );
        await tester.pumpAndSettle();

        final Finder submitButton = find.byKey(AppWidgetKeys.keys['SignInSubmitButton']);
        expect(submitButton, findsOneWidget);
        expect(tester.widget<GradientButton>(submitButton).enabled, isTrue);
      },
    );

    testWidgets(
      'home screen should be displayed after a successful sign-in',
      (WidgetTester tester) async {
        when(authRepositoryMock.signInWithCurrentUser()).thenAnswer((_) => null);
        when(localStorageServiceMock.setAuthenticatedUserID(any)).thenAnswer((_) {
          return Future<bool>.value(true);
        });

        when(authRepositoryMock.signInWithEmailAndPassword(
          email: kMockValidEmail,
          password: kMockValidPassword,
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
          kMockValidEmail,
        );
        await tester.enterText(
          find.byKey(AppWidgetKeys.keys['SignInPasswordField']),
          kMockValidPassword,
        );
        await tester.pumpAndSettle();

        await tester.tap(find.byKey(AppWidgetKeys.keys['SignInSubmitButton']));
        await tester.pumpAndSettle();
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
