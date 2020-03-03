import 'package:device_preview/device_preview.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starter_app/src/app.dart';
import 'package:starter_app/src/blocs/authentication/authentication_bloc.dart';
import 'package:starter_app/src/blocs/simple_bloc_delegate.dart';
import 'package:starter_app/src/repositories/authentication_repository.dart';
import 'package:starter_app/src/services/local_storage.dart';

bool get isInDebugMode {
  bool inDebugMode = false;
  assert(inDebugMode = true);
  return inDebugMode;
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final LocalStorageService localStorageService = await LocalStorageService.getInstance();
  final AuthenticationRepository authRepository = AuthenticationRepository();

  BlocSupervisor.delegate = SimpleBlocDelegate();
  final FirebaseAnalytics firebaseAnalytics = FirebaseAnalytics();

  runApp(
    DevicePreview(
      enabled: false, //isInDebugMode,
      builder: (BuildContext context) {
        return MultiBlocProvider(
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
        );
      },
    ),
  );
}
