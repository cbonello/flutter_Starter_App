import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_focus_watcher/flutter_focus_watcher.dart';

import '../../blocs/blocs.dart';
import '../../repositories/repositories.dart';
import '../../utils/utils.dart';
import 'form.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({@required AuthenticationRepository authRepository})
      : _authRepository = authRepository;

  final AuthenticationRepository _authRepository;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FocusWatcher(
        child: Scaffold(
          appBar: AppBar(title: Text(context.l10n().msgPasswordReset)),
          resizeToAvoidBottomInset: true,
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
      ),
    );
  }
}
