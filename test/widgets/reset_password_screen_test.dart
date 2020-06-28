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

const String kMockEmail = 'john.doe@yahoo.com';

void main() {
  final LocalStorageService localStorageServiceMock = MockLocalStorageService();
  final AuthenticationRepository authRepositoryMock = MockAuthenticationRepository();
  final AnalyticsService analyticsServiceMock = MockAnalyticsService();

  group('Reset Password screen', () {
    testWidgets(
      'Reset button should be disabled by default',
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
              home: ResetPasswordScreen(authRepository: authRepositoryMock),
            ),
          ),
        );
        await tester.pumpAndSettle();

        final Finder buttonFinder = find.byKey(
          AppWidgetKeys.keys['PasswordResetSubmitButton'],
        );
        expect(buttonFinder, findsOneWidget);
        expect(tester.widget<GradientButton>(buttonFinder).enabled, isFalse);
      },
    );

    testWidgets(
      'Reset button should be enabled when email is set',
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
              home: ResetPasswordScreen(authRepository: authRepositoryMock),
            ),
          ),
        );
        await tester.pumpAndSettle();

        await tester.enterText(
          find.byKey(AppWidgetKeys.keys['PasswordResetEmailField']),
          kMockEmail,
        );
        await tester.pumpAndSettle();

        final Finder buttonFinder = find.byKey(
          AppWidgetKeys.keys['PasswordResetSubmitButton'],
        );
        expect(buttonFinder, findsOneWidget);
        expect(tester.widget<GradientButton>(buttonFinder).enabled, isTrue);
      },
    );

    testWidgets(
      'Reset dialog should be displayed after email is sent',
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
              home: ResetPasswordScreen(authRepository: authRepositoryMock),
            ),
          ),
        );
        await tester.pumpAndSettle();

        await tester.enterText(
          find.byKey(AppWidgetKeys.keys['PasswordResetEmailField']),
          kMockEmail,
        );
        await tester.pumpAndSettle();

        final Finder buttonFinder = find.byKey(
          AppWidgetKeys.keys['PasswordResetSubmitButton'],
        );
        expect(buttonFinder, findsOneWidget);
        await tester.tap(buttonFinder);
        await tester.pumpAndSettle();

        expect(
          find.byKey(AppWidgetKeys.keys['PasswordResetEmailSentDialog']),
          findsOneWidget,
        );
      },
    );
  });
}
