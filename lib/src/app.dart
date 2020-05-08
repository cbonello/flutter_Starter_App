import 'package:device_preview/device_preview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/src/utils/app_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import 'blocs/authentication/authentication_bloc.dart';
import 'configuration.dart';
import 'repositories/authentication_repository.dart';
import 'services/analytics.dart';
import 'ui/home/screen.dart';
import 'ui/signin/screen.dart';
import 'ui/splash/screen.dart';
import 'utils/theme.dart';

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
    final MediaQueryData mediaQuery = MediaQuery.of(context, nullOk: true);

    return PlatformApp(
      onGenerateTitle: (BuildContext context) => kAppName,
      debugShowCheckedModeBanner: false,
      locale: kUseDevicePreview ? DevicePreview.of(context)?.locale : null,
      builder: kUseDevicePreview ? DevicePreview.appBuilder : null,
      localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
        AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: kSupportedLanguages,
      android: (BuildContext context) => MaterialAppData(
        theme: AppTheme.theme(Brightness.light),
        themeMode: mediaQuery?.platformBrightness == Brightness.dark
            ? ThemeMode.dark
            : ThemeMode.light,
        navigatorObservers: kIsWeb == false && kUseFirebaseAnalytics
            ? <NavigatorObserver>[widget._analyticsService.getAnalyticsObserver()]
            : null,
      ),
      ios: (_) => CupertinoAppData(
        theme: CupertinoThemeData(
          brightness: mediaQuery.platformBrightness,
        ),
      ),
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
  }
}
