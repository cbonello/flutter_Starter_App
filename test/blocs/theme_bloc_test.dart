import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starter_app/src/services/services.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_starter_app/src/blocs/blocs.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('Theme Bloc:', () {
    LocalStorageService localStorageService;

    setUpAll(() {
      SharedPreferences.setMockInitialValues(<String, dynamic>{});
    });

    group('Initialization:', () {
      test('should throw an assertion error for invalid args', () {
        expect(() => ThemeBloc(localStorageService: null), throwsAssertionError);
      });

      blocTest<ThemeBloc, ThemeMode, ThemeMode>(
        'should default to ThemeMode.system',
        build: () async {
          localStorageService = await LocalStorageService.getInstance();
          return ThemeBloc(localStorageService: localStorageService);
        },
        skip: 0,
        expect: <ThemeMode>[ThemeMode.system],
      );

      blocTest<ThemeBloc, ThemeMode, ThemeMode>(
        'should default to the theme saved in SharedPreferences',
        build: () async {
          localStorageService = await LocalStorageService.getInstance();
          localStorageService.setPreferredTheme(ThemeMode.light);
          return ThemeBloc(localStorageService: localStorageService);
        },
        skip: 0,
        expect: <ThemeMode>[ThemeMode.light],
      );
    });

    group('Theme update event:', () {
      blocTest<ThemeBloc, ThemeMode, ThemeMode>(
        'should updated the theme',
        build: () async {
          localStorageService = await LocalStorageService.getInstance();
          localStorageService.setPreferredTheme(ThemeMode.dark);
          return ThemeBloc(localStorageService: localStorageService);
        },
        act: (ThemeBloc bloc) async => bloc.add(ThemeMode.system),
        skip: 0,
        expect: <ThemeMode>[ThemeMode.dark, ThemeMode.system],
      );
    });
  });
}
