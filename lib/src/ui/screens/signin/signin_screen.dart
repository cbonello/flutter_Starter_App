import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:starter_app/src/blocs/signin/signin_bloc.dart';
import 'package:starter_app/src/repositories/authentication_repository.dart';
import 'package:starter_app/src/ui/screens/signin/signin_form.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({@required AuthenticationRepository authRepository})
      : _authRepository = authRepository;

  final AuthenticationRepository _authRepository;

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
          child: BlocProvider<SignInBloc>(
            create: (BuildContext context) => SignInBloc(authRepository: _authRepository),
            child: SignInForm(
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
