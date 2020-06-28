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

import '../mock/repositories.dart';
import '../mock/services.dart';

const String kValidMockEmail = 'john.doe@yahoo.com';
const String kInvalidMockEmail = 'john.doe@yahoo';
const String kMockValidPassword = 'password1234';
const String kMockInvalidPassword = 'pass';

void main() {
  final LocalStorageService localStorageServiceMock = MockLocalStorageService();
  final AuthenticationRepository authRepositoryMock = MockAuthenticationRepository();
  final AnalyticsService analyticsServiceMock = MockAnalyticsService();

  group('Sign-up screen', () {
    testWidgets(
      'sign-up button should be disabled by default',
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
              home: SignUpScreen(
                authRepository: authRepositoryMock,
                analyticsService: analyticsServiceMock,
              ),
            ),
          ),
        );
        await tester.pumpAndSettle();

        final Finder buttonFinder = find.byKey(AppWidgetKeys.keys['SignUpSubmitButton']);
        expect(buttonFinder, findsOneWidget);
        expect(tester.widget<GradientButton>(buttonFinder).enabled, isFalse);
      },
    );

    testWidgets(
      'sign-up button should be disabled if an invalid email is entered',
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
              home: SignUpScreen(
                authRepository: authRepositoryMock,
                analyticsService: analyticsServiceMock,
              ),
            ),
          ),
        );
        await tester.pumpAndSettle();

        await tester.enterText(
          find.byKey(AppWidgetKeys.keys['SignUpEmailField']),
          kInvalidMockEmail,
        );
        await tester.pumpAndSettle();

        final Finder buttonFinder = find.byKey(AppWidgetKeys.keys['SignUpSubmitButton']);
        expect(buttonFinder, findsOneWidget);
        expect(tester.widget<GradientButton>(buttonFinder).enabled, isFalse);
      },
    );

    testWidgets(
      'sign-up button should be disabled if an invalid password is entered',
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
              home: SignUpScreen(
                authRepository: authRepositoryMock,
                analyticsService: analyticsServiceMock,
              ),
            ),
          ),
        );
        await tester.pumpAndSettle();

        await tester.enterText(
          find.byKey(AppWidgetKeys.keys['SignUpPasswordField']),
          kMockInvalidPassword,
        );
        await tester.pumpAndSettle();

        final Finder buttonFinder = find.byKey(AppWidgetKeys.keys['SignUpSubmitButton']);
        expect(buttonFinder, findsOneWidget);
        expect(tester.widget<GradientButton>(buttonFinder).enabled, isFalse);
      },
    );

    testWidgets(
      'sign-up button should be enabled when valid email and password are entered',
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
              home: SignUpScreen(
                authRepository: authRepositoryMock,
                analyticsService: analyticsServiceMock,
              ),
            ),
          ),
        );
        await tester.pumpAndSettle();

        await tester.enterText(
          find.byKey(AppWidgetKeys.keys['SignUpEmailField']),
          kValidMockEmail,
        );
        await tester.enterText(
          find.byKey(AppWidgetKeys.keys['SignUpPasswordField']),
          kMockValidPassword,
        );
        await tester.tap(find.byKey(AppWidgetKeys.keys['SignUpTOSCheckbox']));
        await tester.pumpAndSettle();

        final Finder buttonFinder = find.byKey(AppWidgetKeys.keys['SignUpSubmitButton']);
        expect(buttonFinder, findsOneWidget);
        expect(tester.widget<GradientButton>(buttonFinder).enabled, isTrue);
      },
    );

    testWidgets(
      'Account verification dialog should be displayed after a successful sign-up',
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
              home: SignUpScreen(
                authRepository: authRepositoryMock,
                analyticsService: analyticsServiceMock,
              ),
            ),
          ),
        );
        await tester.pumpAndSettle();

        await tester.enterText(
          find.byKey(AppWidgetKeys.keys['SignUpEmailField']),
          kValidMockEmail,
        );
        await tester.enterText(
          find.byKey(AppWidgetKeys.keys['SignUpPasswordField']),
          kMockValidPassword,
        );
        await tester.tap(find.byKey(AppWidgetKeys.keys['SignUpTOSCheckbox']));
        await tester.pumpAndSettle();

        final Finder buttonFinder = find.byKey(AppWidgetKeys.keys['SignUpSubmitButton']);
        expect(buttonFinder, findsOneWidget);
        await tester.tap(buttonFinder);
        await tester.pumpAndSettle();

        expect(
          find.byKey(AppWidgetKeys.keys['SignUpEmailSentDialog']),
          findsOneWidget,
        );
      },
    );

    testWidgets(
      'pressing the "Sign-In" button should display the Sign-In screen',
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
              home: SignUpScreen(
                authRepository: authRepositoryMock,
                analyticsService: analyticsServiceMock,
              ),
            ),
          ),
        );
        await tester.pumpAndSettle();

        await tester.tap(find.byKey(AppWidgetKeys.keys['SignUpSignInButton']));
        await tester.pumpAndSettle();

        final Finder buttonFinder = find.byKey(
          AppWidgetKeys.keys['SignInSubmitButton'],
        );
        expect(buttonFinder, findsOneWidget);
      },
    );
  });
}
