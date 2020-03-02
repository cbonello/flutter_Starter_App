import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starter_app/src/app.dart';
import 'package:starter_app/src/blocs/authentication/authentication_bloc.dart';
import 'package:starter_app/src/blocs/simple_bloc_delegate.dart';
import 'package:starter_app/src/services/service_locator.dart';

bool get isInDebugMode {
  bool inDebugMode = false;
  assert(inDebugMode = true);
  return inDebugMode;
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();

  BlocSupervisor.delegate = SimpleBlocDelegate();
  final FirebaseAnalytics firebaseAnalytics = FirebaseAnalytics();

  runApp(
    MultiBlocProvider(
      providers: <BlocProvider<dynamic>>[
        BlocProvider<AuthenticationBloc>(
          create: (BuildContext _) {
            return AuthenticationBloc(
              firebaseAnalytics: firebaseAnalytics,
            )..add(AppStartedAuthenticationEvent());
          },
        ),
      ],
      child: App(),
    ),
  );
}
