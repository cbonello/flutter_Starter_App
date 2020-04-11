import 'package:flushbar/flushbar.dart';
import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:starter_app/src/blocs/reset_password/reset_password_bloc.dart';
import 'package:starter_app/src/ui/widgets/app_logo.dart';
import 'package:starter_app/src/ui/widgets/form_fields.dart';
import 'package:starter_app/src/utils/theme.dart';

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

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations(<DeviceOrientation>[
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    _resetPasswordBloc = context.bloc<ResetPasswordBloc>();
    _emailController = TextEditingController();
    _emailController.addListener(_onEmailChanged);
  }

  @override
  void dispose() {
    _emailController.dispose();
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
    return BlocListener<ResetPasswordBloc, ResetPasswordState>(
      listener: (BuildContext context, ResetPasswordState state) async {
        if (state.exceptionRaised != null) {
          final Flushbar<Object> error = FlushbarHelper.createError(
            title: 'Password reset failure',
            message: state.exceptionRaised.message,
          );
          await error.show(context);
        } else if (state.isSuccess) {
          await showPlatformDialog<void>(
            context: context,
            builder: (_) => PlatformAlertDialog(
              content: Text('A password reset link has been sent to ${state.email}.'),
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
      child: BlocBuilder<ResetPasswordBloc, ResetPasswordState>(
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
      ),
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
