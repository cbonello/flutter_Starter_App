import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_auth/src/blocs/signup/signup_bloc.dart';
import 'package:flutter_auth/src/repositories/authentication_repository.dart';
import 'package:flutter_auth/src/services/analytics.dart';
import 'package:flutter_auth/src/ui/screens/signup/signup_form.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({
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
  Widget build(BuildContext context) {
    return SafeArea(
      child: PlatformScaffold(
        android: (BuildContext context) => MaterialScaffoldData(
          resizeToAvoidBottomInset: true,
        ),
        body: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (OverscrollIndicatorNotification overscroll) {
            overscroll.disallowGlow();
            return true;
          },
          child: BlocProvider<SignUpBloc>(
            create: (BuildContext _) => SignUpBloc(authRepository: _authRepository),
            child: SignUpForm(
              authRepository: _authRepository,
              analyticsService: _analyticsService,
              widthFactor: 0.9,
              logoScaleFactor: 1.0,
            ),
          ),
        ),
      ),
    );
  }
}
