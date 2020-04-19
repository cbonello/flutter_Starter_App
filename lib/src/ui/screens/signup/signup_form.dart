import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_auth/src/configuration.dart';
import 'package:flutter_auth/src/ui/widgets/app_snackbar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_auth/src/blocs/signup/signup_bloc.dart';
import 'package:flutter_auth/src/repositories/authentication_repository.dart';
import 'package:flutter_auth/src/services/analytics.dart';
import 'package:flutter_auth/src/utils/app_localizations.dart';
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
  SnackBar _signingUpSnackBar;

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
    _agreedToTOSAndPolicy = false;
    _signUpBloc = context.bloc<SignUpBloc>();
  }

  @override
  void didChangeDependencies() {
    _emailFocus = FocusNode(debugLabel: context.l10n().msgEmail);
    _passwordFocus = FocusNode(debugLabel: context.l10n().msgPassword);
    _signingUpSnackBar = AppSnackBar.createLoading(
      message: context.l10n().msgSigningUp,
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
          final SnackBar error = AppSnackBar.createError(
            title: context.l10n().msgSignUpFailure,
            message: state.exceptionRaised.message,
          );
          Scaffold.of(context).removeCurrentSnackBar();
          Scaffold.of(context).showSnackBar(error);
        } else if (state.isSubmitting) {
          Scaffold.of(context).showSnackBar(_signingUpSnackBar);
        } else if (state.isVerificationEmailSent) {
          Scaffold.of(context).removeCurrentSnackBar();
          await showPlatformDialog<void>(
            context: context,
            builder: (_) => PlatformAlertDialog(
              title: Text(context.l10n().msgAccountVerification),
              content: Text(
                context.l10n().msgAccountVerificationExplanation(state.user.email),
              ),
              actions: <Widget>[
                PlatformDialogAction(
                  onPressed: () {
                    try {
                      Navigator.of(context)
                          .popUntil((dynamic route) => route.isFirst as bool);
                    } catch (_) {}
                  },
                  child: PlatformText(context.l10n().msgOk),
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
                      key: const Key('SignUpEmailField'),
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
                      validator: (_) {
                        if (_emailController.text.isNotEmpty) {
                          if (state.isEmailValid == false) {
                            return context.l10n().msgEnterValidEmail;
                          }
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10.0),
                    AppPassworFormField(
                      key: const Key('SignUpPasswordField'),
                      controller: _passwordController,
                      validator: (_) {
                        if (_passwordController.text.isNotEmpty) {
                          if (!isValidPasswordLength(_passwordController.text)) {
                            return context.l10n().msgWeakTooShort('$kMinPasswordLength');
                          }
                          if (!isValidPasswordStrength(_passwordController.text)) {
                            return context.l10n().msgWeakPassword;
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
                          key: const Key('SignUpTOSCheckbox'),
                          materialTapTargetSize: MaterialTapTargetSize.padded,
                          activeColor: _agreedToTOSAndPolicy
                              ? Theme.of(context).primaryColor
                              : Colors.grey,
                          value: _agreedToTOSAndPolicy,
                          onChanged: _onTOSChanged,
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () => _onTOSChanged(!_agreedToTOSAndPolicy),
                            child: Text(context.l10n().msgToS),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: GradientButton(
                          key: const Key('SignUpSubmitButton'),
                          gradient: AppTheme.widgetGradient,
                          onPressed:
                              isSignUpButtonEnabled(state) ? _onFormSubmitted : null,
                          child: Text(
                            context.l10n().msgSignUp,
                            style: isSignUpButtonEnabled(state)
                                ? AppTheme.buttonEnabledTextStyle
                                : AppTheme.buttonDisabledTextStyle,
                          ),
                        )),
                    const Spacer(),
                    FlatButton(
                      key: const Key('SignUpSignInButton'),
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
                            context.l10n().msgAlreadyHaveAccount,
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            context.l10n().msgSignIn,
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
