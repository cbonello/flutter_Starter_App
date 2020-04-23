import 'package:flutter/material.dart';
import 'package:flutter_auth/src/blocs/authentication/authentication_bloc.dart';
import 'package:flutter_auth/src/configuration.dart';
import 'package:flutter_auth/src/keys.dart';
import 'package:flutter_auth/src/repositories/authentication_repository.dart';
import 'package:flutter_auth/src/services/analytics.dart';
import 'package:flutter_auth/src/services/local_storage.dart';
import 'package:flutter_auth/src/ui/common/index.dart';
import 'package:flutter_auth/src/ui/reset_password/screen.dart';
import 'package:flutter_auth/src/utils/app_localizations.dart';
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

        final Finder buttonFinder =
            find.byKey(AppWidgetKeys.keys['PasswordResetSubmitButton']);
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

        final Finder buttonFinder =
            find.byKey(AppWidgetKeys.keys['PasswordResetSubmitButton']);
        expect(buttonFinder, findsOneWidget);
        expect(tester.widget<GradientButton>(buttonFinder).enabled, isTrue);
      },
    );
  });
}
