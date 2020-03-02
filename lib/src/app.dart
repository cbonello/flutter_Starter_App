import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:starter_app/src/blocs/authentication/authentication_bloc.dart';
import 'package:starter_app/src/ui/screens/home.dart';
import 'package:starter_app/src/ui/screens/signin/signin_screen.dart';
import 'package:starter_app/src/ui/screens/splash_screen.dart';
import 'package:starter_app/src/utils/constants.dart';
import 'package:starter_app/src/utils/theme.dart';

class App extends StatefulWidget {
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
        print(currentFocus);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: PlatformApp(
        onGenerateTitle: (BuildContext context) => APP_NAME,
        debugShowCheckedModeBanner: false,
        android: (BuildContext context) => MaterialAppData(
          theme: AppTheme.theme(Brightness.light),
          themeMode: mediaQuery?.platformBrightness == Brightness.dark
              ? ThemeMode.dark
              : ThemeMode.light,
        ),
        home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (BuildContext context, AuthenticationState state) {
            if (state is AuthenticatedAuthenticationState) {
              return HomeScreen();
            }
            if (state is UnauthenticatedAuthenticationState) {
              return SignInScreen();
            }
            return SplashScreen();
          },
        ),
      ),
    );
  }
}
