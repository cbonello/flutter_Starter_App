import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_auth/src/blocs/authentication/authentication_bloc.dart';
import 'package:flutter_auth/src/repositories/authentication_repository.dart';
import 'package:flutter_auth/src/services/analytics.dart';
import 'package:flutter_auth/src/ui/screens/home.dart';
import 'package:flutter_auth/src/ui/screens/signin/signin_screen.dart';
import 'package:flutter_auth/src/ui/screens/splash_screen.dart';
import 'package:flutter_auth/src/utils/constants.dart';
import 'package:flutter_auth/src/utils/theme.dart';

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

    return GestureDetector(
      // See https://flutterigniter.com/dismiss-keyboard-form-lose-focus/
      onTap: () {
        final FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: PlatformApp(
        onGenerateTitle: (BuildContext context) => kAppName,
        debugShowCheckedModeBanner: false,
        android: (BuildContext context) => MaterialAppData(
          theme: AppTheme.theme(Brightness.light),
          themeMode: mediaQuery?.platformBrightness == Brightness.dark
              ? ThemeMode.dark
              : ThemeMode.light,
          navigatorObservers: [widget._analyticsService.getAnalyticsObserver()],
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
      ),
    );
  }
}
