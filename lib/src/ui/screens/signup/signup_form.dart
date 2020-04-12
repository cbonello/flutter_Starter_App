import 'package:flushbar/flushbar.dart';
import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_auth/src/blocs/signup/signup_bloc.dart';
import 'package:flutter_auth/src/repositories/authentication_repository.dart';
import 'package:flutter_auth/src/services/analytics.dart';
import 'package:flutter_auth/src/ui/screens/signin/signin_screen.dart';
import 'package:flutter_auth/src/ui/widgets/app_logo.dart';
import 'package:flutter_auth/src/ui/widgets/form_fields.dart';
import 'package:flutter_auth/src/utils/theme.dart';
import 'package:flutter_auth/src/utils/validators.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({
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
  SignUpFormState createState() => SignUpFormState();
}

class SignUpFormState extends State<SignUpForm> {
  TextEditingController _nameController;
  TextEditingController _emailController;
  TextEditingController _passwordController;
  FocusNode _emailFocus, _passwordFocus;
  bool _agreedToTOSAndPolicy;
  SignUpBloc _signUpBloc;
  Flushbar<Object> _signingUpFlushbar;

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations(<DeviceOrientation>[
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    _agreedToTOSAndPolicy = false;
    _signUpBloc = context.bloc<SignUpBloc>();
    _emailController = TextEditingController();
    _emailController.addListener(_onEmailChanged);
    _passwordController = TextEditingController();
    _passwordController.addListener(_onPasswordChanged);
  }

  @override
  void didChangeDependencies() {
    _signingUpFlushbar = FlushbarHelper.createLoading(
      message: 'Signing up...',
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
    _nameController?.dispose();
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
    return BlocConsumer<SignUpBloc, SignUpState>(
      listener: (BuildContext context, SignUpState state) async {
        if (state.isFailure) {
          final Flushbar<Object> flushbar = FlushbarHelper.createError(
            title: 'Sign up failure',
            message: state.exceptionRaised.message,
          );
          flushbar.show(context);
        } else if (state.isSubmitting) {
          _signingUpFlushbar.show(context);
        } else if (state.isVerificationEmailSent) {
          _signingUpFlushbar.dismiss();
          await showPlatformDialog<void>(
            context: context,
            builder: (_) => PlatformAlertDialog(
              title: const Text('Account Verification'),
              content: Text(
                'An account verification email was sent to ${state.user.email} with instructions on how to verify your address.',
              ),
              actions: <Widget>[
                PlatformDialogAction(
                  onPressed: () {
                    try {
                      Navigator.of(context)
                          .popUntil((dynamic route) => route.isFirst as bool);
                    } catch (_) {}
                  },
                  child: PlatformText('OK'),
                ),
              ],
            ),
          );
        }
      },
      builder: (BuildContext context, SignUpState state) {
        return Center(
          child: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height - kToolbarHeight,
              child: FractionallySizedBox(
                widthFactor: widget.widthFactor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
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
                      validator: (_) {
                        if (_emailController.text.isNotEmpty) {
                          if (state.isEmailValid == false) {
                            return 'Enter a valid email address';
                          }
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10.0),
                    AppPassworFormField(
                      controller: _passwordController,
                      validator: (_) {
                        if (_passwordController.text.isNotEmpty) {
                          if (!isValidPasswordLength(_passwordController.text)) {
                            return 'Password is too short (8 characters minimum)';
                          }
                          if (!isValidPasswordStrength(_passwordController.text)) {
                            return 'Password is too weak';
                          }
                        }
                        return null;
                      },
                      textInputAction: TextInputAction.done,
                      focusNode: _passwordFocus,
                    ),
                    const SizedBox(height: 10.0),
                    Row(
                      children: <Widget>[
                        Checkbox(
                          activeColor: _agreedToTOSAndPolicy
                              ? Theme.of(context).primaryColor
                              : Colors.grey,
                          value: _agreedToTOSAndPolicy,
                          onChanged: _onTOSChanged,
                        ),
                        // Expanded(child: Container()) to prevent text overflow.
                        Expanded(
                          // ignore: avoid_unnecessary_containers
                          child: Container(
                            child: GestureDetector(
                              onTap: () => _onTOSChanged(!_agreedToTOSAndPolicy),
                              child: const Text(
                                'I agree to the Terms of Services and Privacy Policy',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: GradientButton(
                          gradient: AppTheme.widgetGradient,
                          onPressed:
                              isSignUpButtonEnabled(state) ? _onFormSubmitted : null,
                          child: Text(
                            'Sign up',
                            style: isSignUpButtonEnabled(state)
                                ? AppTheme.buttonEnabledTextStyle
                                : AppTheme.buttonDisabledTextStyle,
                          ),
                        )),
                    const Spacer(),
                    FlatButton(
                      onPressed: () {
                        Navigator.push<void>(
                          context,
                          platformPageRoute<void>(
                            context: context,
                            builder: (_) => SignInScreen(
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
                            'Already have an account?',
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            'Sign in',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 14,
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
      _passwordController.text.trim().isNotEmpty &&
      _agreedToTOSAndPolicy;

  bool isSignUpButtonEnabled(SignUpState state) {
    return state.isFormValid && isPopulated && !state.isSubmitting;
  }

  void _onEmailChanged() {
    _signUpBloc.add(SignUpEvent.emailChanged(email: _emailController.text.trim()));
    setState(() {});
  }

  void _onPasswordChanged() {
    _signUpBloc
        .add(SignUpEvent.passwordChanged(password: _passwordController.text.trim()));
    setState(() {});
  }

  void _onTOSChanged(bool newValue) {
    setState(() => _agreedToTOSAndPolicy = newValue);
  }

  void _onFormSubmitted() {
    _signUpBloc.add(
      SignUpEvent.submitted(
        email: _emailController.text,
        password: _passwordController.text,
      ),
    );
  }
}
