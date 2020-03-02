import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:starter_app/src/blocs/signup/signup_bloc.dart';
import 'package:starter_app/src/ui/screens/signup/signup_form.dart';

class SignUpScreen extends StatelessWidget {
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
            create: (BuildContext _) => SignUpBloc(),
            child: const SignUpForm(
              widthFactor: 0.9,
              logoScaleFactor: 1.0,
            ),
          ),
        ),
      ),
    );
  }
}
