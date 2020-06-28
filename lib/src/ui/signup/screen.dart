import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_focus_watcher/flutter_focus_watcher.dart';

import '../../blocs/blocs.dart';
import '../../repositories/repositories.dart';
import '../../services/services.dart';
import 'form.dart';

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
      child: FocusWatcher(
        child: Scaffold(
          resizeToAvoidBottomInset: true,
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
      ),
    );
  }
}
