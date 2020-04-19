import 'package:flutter/widgets.dart';
import 'package:flutter_auth/l10n/messages_all.dart';
import 'package:intl/intl.dart';

extension AppLocalizationsExtension on BuildContext {
  AppLocalizations l10n() {
    return AppLocalizations.of(this);
  }
}

class AppLocalizations {
  AppLocalizations(this.localeName) {
    current = this;
  }

  static AppLocalizations current;
  final String localeName;

  static Future<AppLocalizations> load(Locale locale) {
    final String name = locale.countryCode == null || locale.countryCode.isEmpty
        ? locale.languageCode
        : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);

    return initializeMessages(localeName).then((dynamic _) {
      Intl.defaultLocale = localeName;
      return AppLocalizations(localeName);
    });
  }

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  String get msgAlreadyHaveAccount => Intl.message(
        'Already have an account?',
        name: 'msgAlreadyHaveAccount',
      );
  String get msgAccountVerification => Intl.message(
        'Account Verification',
        name: 'msgAccountVerification',
      );
  String msgAccountVerificationExplanation(String email) => Intl.message(
        'An account verification email was sent to $email with instructions on how to verify your address.',
        args: <String>[email],
        name: 'msgAccountVerificationExplanation',
      );
  String get msgDontHaveAccount => Intl.message(
        'Don\'t have an account?',
        name: 'msgDontHaveAccount',
      );
  String get msgEmail => Intl.message('Email', name: 'msgEmail');
  String get msgEnterValidEmail => Intl.message(
        'Enter a valid email address',
        name: 'msgEnterValidEmail',
      );
  String get msgEnterYourName => Intl.message(
        'Enter your name',
        name: 'msgEnterYourName',
      );
  String get msgError => Intl.message('Error', name: 'msgError');
  String get msgFirstName => Intl.message('First Name', name: 'msgFirstName');
  String get msgForgotPasswprd => Intl.message(
        'Forgot Password?',
        name: 'msgForgotPasswprd',
      );
  String get msgName => Intl.message('Name', name: 'msgName');
  String get msgOk => Intl.message('OK', name: 'msgOk');
  String get msgOr => Intl.message('OR', name: 'msgOr');
  String get msgPassword => Intl.message('Password', name: 'msgPassword');
  String get msgPasswordReset => Intl.message(
        'Password Reset',
        name: 'msgPasswordReset',
      );
  String msgPasswordResetSent(String email) => Intl.message(
        'A password reset email was sent to $email.',
        args: <String>[email],
        name: 'msgPasswordResetSent',
      );
  String get msgPasswordResetFailure => Intl.message(
        'Password reset failure',
        name: 'msgPasswordResetFailure',
      );
  String get msgSendingPasswordResetEmail => Intl.message(
        'Sending Password Reset Email...',
        name: 'msgSendingPasswordResetEmail',
      );
  String get msgSignIn => Intl.message('Sign in', name: 'msgSignIn');
  String get msgSignInFailure => Intl.message(
        'Sign in failure',
        name: 'msgSignInFailure',
      );
  String get msgSignOut => Intl.message('Sign Out', name: 'msgSignOut');
  String get msgSignUp => Intl.message('Sign up', name: 'msgSignUp');
  String get msgSignUpFailure => Intl.message(
        'Sign up failure',
        name: 'msgSignUpFailure',
      );
  String get msgSigningIn => Intl.message('Signing in...', name: 'msgSigningIn');
  String get msgSigningUp => Intl.message('Signing up...', name: 'msgSigningUp');
  String get msgSubmit => Intl.message('Submit', name: 'msgSubmit');
  String get msgToS => Intl.message(
        'I agree to the Terms of Services and Privacy Policy',
        name: 'msgToS',
      );
  String get msgWeakPassword => Intl.message(
        'Password is too weak',
        name: 'msgWeakPassword',
      );
  String msgWeakTooShort(String minLength) => Intl.message(
        'Password is too short ($minLength characters minimum)',
        args: <String>[minLength],
        name: 'msgWeakTooShort',
      );
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => <String>['en', 'fr'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) => AppLocalizations.load(locale);

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}
