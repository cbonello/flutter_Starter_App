import 'package:flushbar/flushbar.dart';
import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_auth/src/blocs/authentication/authentication_bloc.dart';
import 'package:flutter_auth/src/blocs/signin/signin_bloc.dart';
import 'package:flutter_auth/src/repositories/authentication_repository.dart';
import 'package:flutter_auth/src/services/analytics.dart';
import 'package:flutter_auth/src/ui/screens/reset_password/reset_password_screen.dart';
import 'package:flutter_auth/src/ui/screens/signup/signup_screen.dart';
import 'package:flutter_auth/src/ui/widgets/app_logo.dart';
import 'package:flutter_auth/src/ui/widgets/form_fields.dart';
import 'package:flutter_auth/src/ui/widgets/horizontal_line.dart';
import 'package:flutter_auth/src/utils/theme.dart';

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
  Flushbar<Object> _signingInFlushbar;

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations(<DeviceOrientation>[
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    _signInBloc = context.bloc<SignInBloc>();
    _emailController = TextEditingController();
    _emailController.addListener(_onEmailChanged);
    _passwordController = TextEditingController();
    _passwordController.addListener(_onPasswordChanged);
  }

  @override
  void didChangeDependencies() {
    _signingInFlushbar = FlushbarHelper.createLoading(
      message: 'Signing in...',
      linearProgressIndicator: const LinearProgressIndicator(),
    );
    _emailFocus = FocusNode(debugLabel: 'Email');
    _passwordFocus = FocusNode(debugLabel: 'Password');
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
        if (state.exceptionRaised != null) {
          final Flushbar<Object> error = FlushbarHelper.createError(
            title: 'Sign in failure',
            message: state.exceptionRaised.message,
          );
          await error.show(context);
        } else if (state.isSubmitting) {
          await _signingInFlushbar.show(context);
        } else if (state.isSuccess) {
          assert(state.user != null);
          context
              .bloc<AuthenticationBloc>()
              .add(AuthenticationEvent.signedIn(user: state.user));
          await _signingInFlushbar.dismiss();
          try {
            Navigator.of(context).popUntil((dynamic route) => route.isFirst as bool);
          } catch (_) {}
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
                      labelText: 'Email',
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
                      validator: (_) =>
                          _emailController.text.isNotEmpty && !state.isEmailValid
                              ? 'Enter a valid email address'
                              : null,
                    ),
                    const SizedBox(height: 10.0),
                    AppPassworFormField(
                      labelText: 'Password',
                      controller: _passwordController,
                      textInputAction: TextInputAction.done,
                      focusNode: _passwordFocus,
                    ),
                    const SizedBox(height: 15.0),
                    GradientButton(
                      gradient: AppTheme.widgetGradient,
                      onPressed: isSignInButtonEnabled(state) ? _onFormSubmitted : null,
                      child: Text(
                        'Sign in',
                        style: isSignInButtonEnabled(state)
                            ? AppTheme.buttonEnabledTextStyle
                            : AppTheme.buttonDisabledTextStyle,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        FlatButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              platformPageRoute<void>(
                                context: context,
                                builder: (_) => ResetPasswordScreen(
                                  authRepository: widget._authRepository,
                                ),
                              ),
                            );
                          },
                          child: Text(
                            'Forgot Password?',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
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
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.0),
                              child: Text('OR'),
                            ),
                            Expanded(
                              child: HorizontalLine(
                                color: AppTheme.horizontalLineColor(
                                    Theme.of(context).brightness),
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
                        borderRadius: 6.0,
                        darkMode: Theme.of(context).brightness == Brightness.dark,
                        onPressed: () {
                          context.bloc<SignInBloc>().add(
                                const SignInEvent.googlePressed(),
                              );
                        },
                      ),
                    ),
                    const Spacer(),
                    FlatButton(
                      onPressed: () {
                        Navigator.push<void>(
                          context,
                          platformPageRoute<void>(
                            context: context,
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
                            'Don\'t have an account?',
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            'Sign up',
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

  bool get isPopulated =>
      _emailController.text.trim().isNotEmpty &&
      _passwordController.text.trim().isNotEmpty;

  bool isSignInButtonEnabled(SignInState state) {
    return state.isFormValid && isPopulated && !state.isSubmitting;
  }

  void _onEmailChanged() {
    _signInBloc.add(SignInEvent.emailChanged(email: _emailController.text.trim()));
    setState(() {});
  }

  void _onPasswordChanged() {
    _signInBloc
        .add(SignInEvent.passwordChanged(password: _passwordController.text.trim()));
    setState(() {});
  }

  void _onFormSubmitted() {
    _signInBloc.add(
      SignInEvent.emailAndPasswordPressed(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      ),
    );
  }
}
