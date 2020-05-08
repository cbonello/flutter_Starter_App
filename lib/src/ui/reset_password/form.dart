import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_auth/src/utils/validators.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import '../../blocs/reset_password/reset_password_bloc.dart';
import '../../keys.dart';
import '../../utils/app_localizations.dart';
import '../../utils/theme.dart';
import '../common/index.dart';

class ResetPasswordForm extends StatefulWidget {
  const ResetPasswordForm({
    Key key,
    @required this.widthFactor,
    @required this.logoScaleFactor,
  }) : super(key: key);

  final double widthFactor, logoScaleFactor;

  @override
  ResetPasswordFormState createState() => ResetPasswordFormState();
}

class ResetPasswordFormState extends State<ResetPasswordForm> {
  TextEditingController _emailController;
  ResetPasswordBloc _resetPasswordBloc;
  SnackBar _resettingSnackBar;

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations(<DeviceOrientation>[
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    _emailController = TextEditingController();
    _emailController.addListener(_onEmailChanged);
    _resetPasswordBloc = context.bloc<ResetPasswordBloc>();
  }

  @override
  void didChangeDependencies() {
    _resettingSnackBar = AppSnackBar.createLoading(
      message: context.l10n().msgSendingPasswordResetEmail,
      progressIndicatorValueColor: Theme.of(context).accentColor,
    );
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _emailController?.dispose();
    SystemChrome.setPreferredOrientations(<DeviceOrientation>[
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ResetPasswordBloc, ResetPasswordState>(
      listener: (BuildContext context, ResetPasswordState state) async {
        if (state.isSubmitting) {
          Scaffold.of(context).showSnackBar(_resettingSnackBar);
        } else if (state.isResetEmailSent) {
          Scaffold.of(context).removeCurrentSnackBar();
          await showPlatformDialog<void>(
            context: context,
            builder: (_) => PlatformAlertDialog(
              title: Text(context.l10n().msgPasswordReset),
              content: Text(context.l10n().msgPasswordResetSent(state.email)),
              actions: <Widget>[
                PlatformDialogAction(
                  onPressed: () {
                    Navigator.of(context).pop(); // Close dialog.
                    Navigator.of(context).pop(); // Go back to sign in screen.
                  },
                  child: PlatformText(context.l10n().msgOk),
                ),
              ],
            ),
          );
        } else if (state.exceptionRaised != null) {
          final SnackBar error = AppSnackBar.createError(
            title: context.l10n().msgPasswordResetFailure,
            message: state.exceptionRaised.message(context),
          );
          Scaffold.of(context).removeCurrentSnackBar();
          Scaffold.of(context).showSnackBar(error);
        }
      },
      builder: (BuildContext context, ResetPasswordState state) {
        return SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.6,
            child: Center(
              child: FractionallySizedBox(
                widthFactor: widget.widthFactor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    const Spacer(),
                    AppLogo(scaleFactor: widget.logoScaleFactor),
                    const Spacer(),
                    AppTextFormField(
                      key: AppWidgetKeys.keys['PasswordResetEmailField'],
                      labelText: context.l10n().msgEmail,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                      controller: _emailController,
                      validator: (_) => _emailController.text.trim().isNotEmpty &&
                              !Validators.isValidEmail(state.email)
                          ? context.l10n().msgEnterValidEmail
                          : null,
                    ),
                    const SizedBox(height: 15.0),
                    GradientButton(
                      key: AppWidgetKeys.keys['PasswordResetSubmitButton'],
                      gradient: AppTheme.widgetGradient,
                      onPressed: _isubmitButtonEnabled(state) ? _onFormSubmitted : null,
                      child: Text(
                        context.l10n().msgSubmit,
                        style: _isubmitButtonEnabled(state)
                            ? AppTheme.buttonEnabledTextStyle
                            : AppTheme.buttonDisabledTextStyle,
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _onEmailChanged() {
    _resetPasswordBloc.add(
      ResetPasswordEvent.emailChanged(email: _emailController.text.trim()),
    );
    setState(() {});
  }

  void _onFormSubmitted() {
    _resetPasswordBloc.add(const ResetPasswordEvent.resetPressed());
  }

  bool _isubmitButtonEnabled(ResetPasswordState state) {
    return state.isPopulated() && state.isValid() && !state.isSubmitting;
  }
}
