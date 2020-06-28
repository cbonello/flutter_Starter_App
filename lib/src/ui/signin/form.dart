import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/blocs.dart';
import '../../configuration.dart';
import '../../keys.dart';
import '../../repositories/repositories.dart';
import '../../services/services.dart';
import '../../utils/utils.dart';
import '../common/common.dart';
import '../screens.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({
    Key key,
    @required AuthenticationRepository authRepository,
    @required AnalyticsService analyticsService,
    @required this.widthFactor,
    @required this.logoScaleFactor,
  })  : assert(authRepository != null),
        _authRepository = authRepository,
        assert(analyticsService != null),
        _analyticsService = analyticsService,
        super(key: key);

  final AuthenticationRepository _authRepository;
  final AnalyticsService _analyticsService;
  final double widthFactor, logoScaleFactor;

  @override
  SignInFormState createState() => SignInFormState();
}

class SignInFormState extends State<SignInForm> {
  TextEditingController _emailController, _passwordController;
  FocusNode _emailFocus, _passwordFocus;
  SignInBloc _signInBloc;
  SnackBar _signingInSnackBar;

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations(<DeviceOrientation>[
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    _emailController = TextEditingController();
    _emailController.addListener(_onEmailChanged);
    _passwordController = TextEditingController();
    _passwordController.addListener(_onPasswordChanged);
    _signInBloc = context.bloc<SignInBloc>();
  }

  @override
  void didChangeDependencies() {
    _emailFocus = FocusNode(debugLabel: context.l10n().msgEmail);
    _passwordFocus = FocusNode(debugLabel: context.l10n().msgPassword);
    _signingInSnackBar = AppSnackBar.createLoading(
      message: context.l10n().msgSigningIn,
      progressIndicatorValueColor: Theme.of(context).accentColor,
    );
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _passwordFocus?.dispose();
    _emailFocus?.dispose();
    _passwordController?.dispose();
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
    return BlocConsumer<SignInBloc, SignInState>(
      listener: (BuildContext context, SignInState state) async {
        if (state.isSubmitting) {
          Scaffold.of(context).showSnackBar(_signingInSnackBar);
        } else if (state.user != null) {
          context
              .bloc<AuthenticationBloc>()
              .add(AuthenticationEvent.signedIn(user: state.user));
          Scaffold.of(context).removeCurrentSnackBar();
          try {
            Navigator.of(context).popUntil((dynamic route) => route.isFirst as bool);
          } catch (_) {}
        } else if (state.exceptionRaised != null) {
          final SnackBar error = AppSnackBar.createError(
            title: context.l10n().msgSignInFailure,
            message: state.exceptionRaised.message(context),
          );
          Scaffold.of(context).removeCurrentSnackBar();
          Scaffold.of(context).showSnackBar(error);
        }
      },
      builder: (BuildContext context, SignInState state) {
        return Center(
          child: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height - kToolbarHeight,
              child: FractionallySizedBox(
                widthFactor: widget.widthFactor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const Spacer(),
                    AppLogo(scaleFactor: widget.logoScaleFactor),
                    const Spacer(),
                    AppTextFormField(
                      key: AppWidgetKeys.keys['SignInEmailField'],
                      labelText: context.l10n().msgEmail,
                      textInputAction: TextInputAction.next,
                      focusNode: _emailFocus,
                      onFieldSubmitted: (_) {
                        fieldFocusChangeCallback(
                          context,
                          _emailFocus,
                          _passwordFocus,
                        );
                      },
                      keyboardType: TextInputType.emailAddress,
                      controller: _emailController,
                      validator: (_) => _emailController.text.trim().isNotEmpty &&
                              !Validators.isValidEmail(state.email)
                          ? context.l10n().msgEnterValidEmail
                          : null,
                    ),
                    const SizedBox(height: 10.0),
                    AppPassworFormField(
                      key: AppWidgetKeys.keys['SignInPasswordField'],
                      labelText: context.l10n().msgPassword,
                      controller: _passwordController,
                      textInputAction: TextInputAction.done,
                      focusNode: _passwordFocus,
                    ),
                    const SizedBox(height: 15.0),
                    GradientButton(
                      key: AppWidgetKeys.keys['SignInSubmitButton'],
                      gradient: AppTheme.widgetGradient,
                      onPressed: state.isSignInButtonEnabled() ? _onFormSubmitted : null,
                      child: Text(
                        context.l10n().msgSignIn,
                        style: state.isSignInButtonEnabled()
                            ? AppTheme.buttonEnabledTextStyle
                            : AppTheme.buttonDisabledTextStyle,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        FlatButton(
                          key: AppWidgetKeys.keys['SignInForgotPasswordButton'],
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute<void>(
                                builder: (_) => ResetPasswordScreen(
                                  authRepository: widget._authRepository,
                                ),
                              ),
                            );
                          },
                          child: Text(
                            context.l10n().msgForgotPasswprd,
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                    if (kUseGoogleASignIn) ...<Widget>[
                      Container(
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: HorizontalLine(
                                  color: AppTheme.horizontalLineColor(
                                      Theme.of(context).brightness),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                child: Text(context.l10n().msgOr),
                              ),
                              Expanded(
                                child: HorizontalLine(
                                  color: AppTheme.horizontalLineColor(
                                    Theme.of(context).brightness,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 15.0),
                      Container(
                        width: double.infinity,
                        child: GoogleSignInButton(
                          key: AppWidgetKeys.keys['SignInGoogleButton'],
                          borderRadius: 6.0,
                          darkMode: Theme.of(context).brightness == Brightness.dark,
                          onPressed: () {
                            context.bloc<SignInBloc>().add(
                                  const SignInEvent.googlePressed(),
                                );
                          },
                        ),
                      ),
                    ],
                    const Spacer(),
                    FlatButton(
                      key: AppWidgetKeys.keys['SignInSignUpButton'],
                      onPressed: () {
                        Navigator.push<void>(
                          context,
                          MaterialPageRoute<void>(
                            builder: (_) => SignUpScreen(
                              authRepository: widget._authRepository,
                              analyticsService: widget._analyticsService,
                            ),
                          ),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            context.l10n().msgDontHaveAccount,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            context.l10n().msgSignUp,
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 20.0 / widget.widthFactor),
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
    _signInBloc.add(SignInEvent.emailChanged(email: _emailController.text.trim()));
    setState(() {});
  }

  void _onPasswordChanged() {
    // trim() is not called since we allow whitespace characters in passwords.
    _signInBloc.add(
      SignInEvent.passwordChanged(password: _passwordController.text),
    );
    setState(() {});
  }

  void _onFormSubmitted() {
    _signInBloc.add(const SignInEvent.emailAndPasswordPressed());
  }
}
