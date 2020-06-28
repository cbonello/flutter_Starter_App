import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'blocs/blocs.dart';
import 'configuration.dart';
import 'repositories/repositories.dart';
import 'services/services.dart';
import 'ui/screens.dart';
import 'utils/utils.dart';

class App extends StatefulWidget {
  const App({
    Key key,
    @required AuthenticationRepository authRepository,
    @required AnalyticsService analyticsService,
  })  : assert(authRepository != null),
        _authRepository = authRepository,
        assert(analyticsService != null),
        _analyticsService = analyticsService,
        super(key: key);

  final AuthenticationRepository _authRepository;
  final AnalyticsService _analyticsService;

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> with WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeMode>(
      builder: (BuildContext context, ThemeMode mode) {
        return MaterialApp(
          onGenerateTitle: (BuildContext context) => kAppName,
          debugShowCheckedModeBanner: false,
          localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
            AppLocalizationsDelegate(),
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: kSupportedLanguages,
          theme: AppTheme.theme(Brightness.light),
          darkTheme: AppTheme.theme(Brightness.dark),
          themeMode: mode,
          navigatorObservers: kIsWeb == false && kUseFirebaseAnalytics
              ? <NavigatorObserver>[widget._analyticsService.getAnalyticsObserver()]
              : <NavigatorObserver>[],
          home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
            builder: (BuildContext context, AuthenticationState state) => state.when(
              uninitialized: () => SplashScreen(),
              authenticated: (_) => HomeScreen(),
              unauthenticated: () => SignInScreen(
                authRepository: widget._authRepository,
                analyticsService: widget._analyticsService,
              ),
            ),
          ),
        );
      },
    );
  }
}
