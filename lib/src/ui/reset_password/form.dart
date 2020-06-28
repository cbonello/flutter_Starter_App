import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/blocs.dart';
import '../../keys.dart';
import '../../utils/utils.dart';
import '../common/common.dart';

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
          await showDialog<void>(
            context: context,
            builder: (_) => AlertDialog(
              key: AppWidgetKeys.keys['PasswordResetEmailSentDialog'],
              title: Text(context.l10n().msgPasswordReset),
              content: Text(context.l10n().msgPasswordResetSent(state.email)),
              actions: <Widget>[
                FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Close dialog.
                    Navigator.of(context).pop(); // Go back to sign in screen.
                  },
                  child: Text(context.l10n().msgOk),
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
                      onPressed: state.isubmitButtonEnabled() ? _onFormSubmitted : null,
                      child: Text(
                        context.l10n().msgSubmit,
                        style: state.isubmitButtonEnabled()
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
}
