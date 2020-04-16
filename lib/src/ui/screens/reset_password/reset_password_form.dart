import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_auth/src/ui/widgets/app_snackbar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_auth/src/blocs/reset_password/reset_password_bloc.dart';
import 'package:flutter_auth/src/ui/widgets/app_logo.dart';
import 'package:flutter_auth/src/ui/widgets/form_fields.dart';
import 'package:flutter_auth/src/utils/theme.dart';

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
      message: 'Sending Password Reset Email...',
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
        if (state.exceptionRaised != null) {
          final SnackBar error = AppSnackBar.createError(
            title: 'Password reset failure',
            message: state.exceptionRaised.message,
          );
          Scaffold.of(context).removeCurrentSnackBar();
          Scaffold.of(context).showSnackBar(error);
        } else if (state.isSubmitting) {
          Scaffold.of(context).showSnackBar(_resettingSnackBar);
        } else if (state.isResetEmailSent) {
          Scaffold.of(context).removeCurrentSnackBar();
          await showPlatformDialog<void>(
            context: context,
            builder: (_) => PlatformAlertDialog(
              title: const Text('Password Reset'),
              content: Text('A password reset email was sent to ${state.email}.'),
              actions: <Widget>[
                PlatformDialogAction(
                  onPressed: () {
                    Navigator.of(context).pop(); // Close dialog.
                    Navigator.of(context).pop(); // Go back to sign in screen.
                  },
                  child: PlatformText('OK'),
                ),
              ],
            ),
          );
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
                      labelText: 'Email',
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                      controller: _emailController,
                      validator: (_) =>
                          _emailController.text.isNotEmpty && !state.isEmailValid
                              ? 'Enter a valid email address'
                              : null,
                    ),
                    const SizedBox(height: 15.0),
                    GradientButton(
                      gradient: AppTheme.widgetGradient,
                      onPressed: isubmitButtonEnabled(state) ? _onFormSubmitted : null,
                      child: Text(
                        'Submit',
                        style: isubmitButtonEnabled(state)
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

  bool get isPopulated => _emailController.text.trim().isNotEmpty;

  bool isubmitButtonEnabled(ResetPasswordState state) {
    return state.isFormValid && isPopulated && !state.isSubmitting;
  }

  void _onEmailChanged() {
    _resetPasswordBloc.add(
      ResetPasswordEvent.emailChanged(email: _emailController.text.trim()),
    );
    setState(() {});
  }

  void _onFormSubmitted() {
    _resetPasswordBloc.add(
      ResetPasswordEvent.resetPressed(email: _emailController.text.trim()),
    );
  }
}
