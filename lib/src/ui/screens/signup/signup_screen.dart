import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:starter_app/src/blocs/signup/signup_bloc.dart';
import 'package:starter_app/src/repositories/authentication_repository.dart';
import 'package:starter_app/src/ui/screens/signup/signup_form.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({@required AuthenticationRepository authRepository})
      : _authRepository = authRepository;

  final AuthenticationRepository _authRepository;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: PlatformScaffold(
        android: (BuildContext context) => MaterialScaffoldData(
          resizeToAvoidBottomInset: false,
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
              widthFactor: 0.9,
              logoScaleFactor: 1.0,
            ),
          ),
        ),
      ),
    );
  }
}
