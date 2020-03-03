// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:starter_app/src/app.dart';
import 'package:starter_app/src/blocs/authentication/authentication_bloc.dart';
import 'package:starter_app/src/repositories/authentication_repository.dart';
import 'package:starter_app/src/services/local_storage.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    WidgetsFlutterBinding.ensureInitialized();

    final LocalStorageService localStorageService =
        await LocalStorageService.getInstance();
    final AuthenticationRepository authRepository = AuthenticationRepository();
    final FirebaseAnalytics firebaseAnalytics = FirebaseAnalytics();

    // Build our app and trigger a frame.
    await tester.pumpWidget(MultiBlocProvider(
      providers: <BlocProvider<dynamic>>[
        BlocProvider<AuthenticationBloc>(
          create: (BuildContext _) {
            return AuthenticationBloc(
              localStorageService: localStorageService,
              authRepository: authRepository,
              firebaseAnalytics: firebaseAnalytics,
            )..add(AppStartedAuthenticationEvent());
          },
        ),
      ],
      child: App(authRepository: authRepository),
    ));

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
