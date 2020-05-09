import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_focus_watcher/flutter_focus_watcher.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import '../../blocs/signup/signup_bloc.dart';
import '../../configuration.dart';
import '../../keys.dart';
import '../../repositories/authentication_repository.dart';
import '../../services/analytics.dart';
import '../../utils/app_localizations.dart';
import '../../utils/theme.dart';
import '../../utils/validators.dart';
import '../common/index.dart';
import '../signin/screen.dart';
import '../tos_privacy/screen.dart';

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
        if (state.isSubmitting) {
          Scaffold.of(context).showSnackBar(_signingUpSnackBar);
        } else if (state.isVerificationEmailSent) {
          Scaffold.of(context).removeCurrentSnackBar();
          await showPlatformDialog<void>(
            context: context,
            builder: (_) => PlatformAlertDialog(
              title: Text(context.l10n().msgAccountVerification),
              content: Text(
                context.l10n().msgAccountVerificationExplanation(state.email),
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
        } else if (state.exceptionRaised != null) {
          final SnackBar error = AppSnackBar.createError(
            title: context.l10n().msgSignUpFailure,
            message: state.exceptionRaised.message(context),
          );
          Scaffold.of(context).removeCurrentSnackBar();
          Scaffold.of(context).showSnackBar(error);
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
                        key: AppWidgetKeys.keys['SignUpEmailField'],
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
                                !state.isValidEmail()
                            ? context.l10n().msgEnterValidEmail
                            : null),
                    const SizedBox(height: 10.0),
                    AppPassworFormField(
                      key: AppWidgetKeys.keys['SignUpPasswordField'],
                      controller: _passwordController,
                      validator: (_) {
                        if (_passwordController.text.isNotEmpty) {
                          if (!Validators.isValidPasswordLength(
                              _passwordController.text)) {
                            return context.l10n().msgWeakTooShort('$kMinPasswordLength');
                          }
                          if (!Validators.isValidPasswordStrength(
                            _passwordController.text,
                          )) {
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
                          key: AppWidgetKeys.keys['SignUpTOSCheckbox'],
                          materialTapTargetSize: MaterialTapTargetSize.padded,
                          activeColor: _agreedToTOSAndPolicy
                              ? Theme.of(context).primaryColor
                              : Colors.grey,
                          value: _agreedToTOSAndPolicy,
                          onChanged: _onTOSChanged,
                        ),
                        Expanded(
                          child: Container(
                            height: 48.0,
                            alignment: Alignment.centerLeft,
                            child: IgnoreFocusWatcher(
                              child: RichText(
                                text: TextSpan(
                                  children: <InlineSpan>[
                                    TextSpan(
                                      text: context.l10n().msgToS1,
                                      style: Theme.of(context).textTheme.bodyText2,
                                    ),
                                    TextSpan(
                                      text: context.l10n().msgToS2,
                                      style: TextStyle(color: Colors.blue),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          Navigator.push<void>(
                                            context,
                                            platformPageRoute<void>(
                                              context: context,
                                              builder: (_) => TosPrivacyScreen(
                                                title: context.l10n().msgToS2,
                                              ),
                                            ),
                                          );
                                        },
                                    ),
                                    TextSpan(
                                      text: context.l10n().msgToS3,
                                      style: Theme.of(context).textTheme.bodyText2,
                                    ),
                                    TextSpan(
                                      text: context.l10n().msgToS4,
                                      style: TextStyle(color: Colors.blue),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          Navigator.push<void>(
                                            context,
                                            platformPageRoute<void>(
                                              context: context,
                                              builder: (_) => TosPrivacyScreen(
                                                title: context.l10n().msgToS4,
                                              ),
                                            ),
                                          );
                                        },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: GradientButton(
                          key: AppWidgetKeys.keys['SignUpSubmitButton'],
                          gradient: AppTheme.widgetGradient,
                          onPressed:
                              _isSignUpButtonEnabled(state) ? _onFormSubmitted : null,
                          child: Text(
                            context.l10n().msgSignUp,
                            style: _isSignUpButtonEnabled(state)
                                ? AppTheme.buttonEnabledTextStyle
                                : AppTheme.buttonDisabledTextStyle,
                          ),
                        )),
                    const Spacer(),
                    FlatButton(
                      key: AppWidgetKeys.keys['SignUpSignInButton'],
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
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
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

  void _onEmailChanged() {
    _signUpBloc.add(SignUpEvent.emailChanged(email: _emailController.text.trim()));
    setState(() {});
  }

  void _onPasswordChanged() {
    _signUpBloc.add(SignUpEvent.passwordChanged(password: _passwordController.text));
    setState(() {});
  }

  void _onTOSChanged(bool newValue) {
    _signUpBloc.add(SignUpEvent.tosChanged(tos: newValue));
    setState(() => _agreedToTOSAndPolicy = newValue);
  }

  bool _isSignUpButtonEnabled(SignUpState state) {
    return state.isPopulated() && state.isValid() && !state.isSubmitting;
  }

  void _onFormSubmitted() {
    _signUpBloc.add(const SignUpEvent.submitted());
  }
}
