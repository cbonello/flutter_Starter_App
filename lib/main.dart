import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'src/application.dart';
import 'src/blocs/blocs.dart';
import 'src/configuration.dart';
import 'src/repositories/authentication_repository.dart';
import 'src/services/analytics.dart';
import 'src/services/local_storage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final LocalStorageService localStorageService = await LocalStorageService.getInstance();
  final AuthenticationRepository authRepository = AuthenticationRepository();
  final AnalyticsService analyticsService = AnalyticsService(
    useGoogleAnalytics: kIsWeb == false && kUseFirebaseAnalytics,
  );

  if (kUseFlutterBlocDelegate) {
    BlocSupervisor.delegate = SimpleBlocDelegate();
  }

  runApp(
    MultiBlocProvider(
      providers: <BlocProvider<dynamic>>[
        BlocProvider<AuthenticationBloc>(
          create: (BuildContext _) {
            return AuthenticationBloc(
              localStorageService: localStorageService,
              authRepository: authRepository,
              analyticsService: analyticsService,
            )..add(const AuthenticationEvent.appStarted());
          },
        ),
        BlocProvider<ThemeBloc>(
          create: (BuildContext _) => ThemeBloc(localStorageService: localStorageService),
        ),
      ],
      child: App(authRepository: authRepository, analyticsService: analyticsService),
    ),
  );
}
