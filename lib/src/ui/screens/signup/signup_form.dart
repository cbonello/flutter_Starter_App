import 'package:flushbar/flushbar.dart';
import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:starter_app/src/blocs/authentication/authentication_bloc.dart';
import 'package:starter_app/src/blocs/signup/signup_bloc.dart';
import 'package:starter_app/src/repositories/authentication_repository.dart';
import 'package:starter_app/src/ui/screens/signin/signin_screen.dart';
import 'package:starter_app/src/ui/widgets/app_logo.dart';
import 'package:starter_app/src/ui/widgets/form_fields.dart';
import 'package:starter_app/src/utils/theme.dart';
import 'package:starter_app/src/utils/validators.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({
    Key key,
    @required AuthenticationRepository authRepository,
    @required this.widthFactor,
    @required this.logoScaleFactor,
  })  : _authRepository = authRepository,
        super(key: key);

  final AuthenticationRepository _authRepository;
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
    _passwordFocus.dispose();
    _emailFocus.dispose();
    _passwordController.dispose();
    _emailController.dispose();
    _nameController.dispose();
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
    return BlocListener<SignUpBloc, SignUpState>(
      listener: (BuildContext context, SignUpState state) {
        if (state.isFailure) {
          final Flushbar<Object> flushbar = FlushbarHelper.createError(
            title: 'Sign up failure',
            message: state.exceptionRaised.message,
          );
          flushbar.show(context);
        } else if (state.isSubmitting) {
          _signingUpFlushbar.show(context);
        } else if (state.isSuccess) {
          context
              .bloc<AuthenticationBloc>()
              .add(AuthenticationEvent.signedIn(user: state.user));
          _signingUpFlushbar.dismiss();
          try {
            Navigator.of(context).popUntil((dynamic route) => route.isFirst as bool);
          } catch (_) {}
        }
      },
      child: BlocBuilder<SignUpBloc, SignUpState>(
        builder: (BuildContext context, SignUpState state) {
          return Center(
            child: SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height,
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
                      Center(
                        child: FlatButton(
                          onPressed: () {
                            Navigator.push<void>(
                              context,
                              platformPageRoute<void>(
                                context: context,
                                builder: (_) => SignInScreen(
                                  authRepository: widget._authRepository,
                                ),
                              ),
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Already have an account?',
                                style:
                                    TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
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
                      ),
                      SizedBox(height: 20.0 / widget.widthFactor),
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
