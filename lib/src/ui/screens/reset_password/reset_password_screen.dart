import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import '../../../blocs/reset_password/reset_password_bloc.dart';
import '../../../repositories/authentication_repository.dart';
import '../../../utils/app_localizations.dart';
import './reset_password_form.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({@required AuthenticationRepository authRepository})
      : _authRepository = authRepository;

  final AuthenticationRepository _authRepository;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: PlatformScaffold(
        appBar: PlatformAppBar(title: const Text('Reset Password')),
        android: (BuildContext context) => MaterialScaffoldData(
          resizeToAvoidBottomInset: true,
        ),
        body: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (OverscrollIndicatorNotification overscroll) {
            overscroll.disallowGlow();
            return true;
          },
          child: BlocProvider<ResetPasswordBloc>(
            create: (BuildContext context) => ResetPasswordBloc(
              authRepository: _authRepository,
            ),
            child: const ResetPasswordForm(widthFactor: 0.9, logoScaleFactor: 1.0),
          ),
        ),
      ),
    );
  }
}
