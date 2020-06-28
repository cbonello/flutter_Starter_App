// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en_US locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en_US';

  static m0(email) => "An account verification email was sent to ${email} with instructions on how to verify your address.";

  static m1(email) => "A password reset email was sent to ${email}.";

  static m2(minLength) => "Password is too short (${minLength} characters minimum)";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "msgAccountVerification" : MessageLookupByLibrary.simpleMessage("Account Verification"),
    "msgAccountVerificationExplanation" : m0,
    "msgAlreadyHaveAccount" : MessageLookupByLibrary.simpleMessage("Already have an account?"),
    "msgApplicationLogo" : MessageLookupByLibrary.simpleMessage("Application logo"),
    "msgCancelled" : MessageLookupByLibrary.simpleMessage("Cancelled"),
    "msgDontHaveAccount" : MessageLookupByLibrary.simpleMessage("Don\'t have an account?"),
    "msgEmail" : MessageLookupByLibrary.simpleMessage("Email"),
    "msgEnterValidEmail" : MessageLookupByLibrary.simpleMessage("Enter a valid email address"),
    "msgEnterYourName" : MessageLookupByLibrary.simpleMessage("Enter your name"),
    "msgError" : MessageLookupByLibrary.simpleMessage("Error"),
    "msgErrorAccountExistsWithDifferentCredential" : MessageLookupByLibrary.simpleMessage("Account already exists with different credential"),
    "msgErrorAccountHasBeenDisabled" : MessageLookupByLibrary.simpleMessage("Account has been disabled"),
    "msgErrorEmailAddressIsNotVerified" : MessageLookupByLibrary.simpleMessage("Email address is not verified"),
    "msgErrorEmailAlreadyRegistered" : MessageLookupByLibrary.simpleMessage("Email is already registered"),
    "msgErrorGoogleAccountsAreDisabled" : MessageLookupByLibrary.simpleMessage("Google accounts are disabled"),
    "msgErrorInvalidCredential" : MessageLookupByLibrary.simpleMessage("Invalid credential"),
    "msgErrorInvalidEmailAddress" : MessageLookupByLibrary.simpleMessage("Invalid email address"),
    "msgErrorMalformedEmailAddress" : MessageLookupByLibrary.simpleMessage("Malformed email address"),
    "msgErrorNoInternetConnection" : MessageLookupByLibrary.simpleMessage("No Internet connection"),
    "msgErrorPasswordNotStrongEnough" : MessageLookupByLibrary.simpleMessage("Password is not strong enough"),
    "msgErrorTooManySignInAttempts" : MessageLookupByLibrary.simpleMessage("Too many sign in attempts, try again later"),
    "msgErrorUnknown" : MessageLookupByLibrary.simpleMessage("Unknown error"),
    "msgErrorWrongPassword" : MessageLookupByLibrary.simpleMessage("Wrong password"),
    "msgFirstName" : MessageLookupByLibrary.simpleMessage("First Name"),
    "msgForgotPasswprd" : MessageLookupByLibrary.simpleMessage("Forgot Password?"),
    "msgIncrement" : MessageLookupByLibrary.simpleMessage("Increment"),
    "msgName" : MessageLookupByLibrary.simpleMessage("Name"),
    "msgOk" : MessageLookupByLibrary.simpleMessage("OK"),
    "msgOr" : MessageLookupByLibrary.simpleMessage("OR"),
    "msgPassword" : MessageLookupByLibrary.simpleMessage("Password"),
    "msgPasswordReset" : MessageLookupByLibrary.simpleMessage("Password Reset"),
    "msgPasswordResetFailure" : MessageLookupByLibrary.simpleMessage("Password reset failure"),
    "msgPasswordResetSent" : m1,
    "msgSendingPasswordResetEmail" : MessageLookupByLibrary.simpleMessage("Sending Password Reset Email..."),
    "msgSignIn" : MessageLookupByLibrary.simpleMessage("Sign in"),
    "msgSignInFailure" : MessageLookupByLibrary.simpleMessage("Sign in failure"),
    "msgSignOut" : MessageLookupByLibrary.simpleMessage("Sign Out"),
    "msgSignUp" : MessageLookupByLibrary.simpleMessage("Sign up"),
    "msgSignUpFailure" : MessageLookupByLibrary.simpleMessage("Sign up failure"),
    "msgSigningIn" : MessageLookupByLibrary.simpleMessage("Signing in..."),
    "msgSigningUp" : MessageLookupByLibrary.simpleMessage("Signing up..."),
    "msgSubmit" : MessageLookupByLibrary.simpleMessage("Submit"),
    "msgThemeDark" : MessageLookupByLibrary.simpleMessage("Dark"),
    "msgThemeLight" : MessageLookupByLibrary.simpleMessage("Light"),
    "msgThemeSystem" : MessageLookupByLibrary.simpleMessage("System"),
    "msgToS1" : MessageLookupByLibrary.simpleMessage("I agree to the "),
    "msgToS2" : MessageLookupByLibrary.simpleMessage("Terms of Services"),
    "msgToS3" : MessageLookupByLibrary.simpleMessage(" and "),
    "msgToS4" : MessageLookupByLibrary.simpleMessage("Privacy Policy"),
    "msgTogglePaswwordVisibility" : MessageLookupByLibrary.simpleMessage("Toggle paswword visibility"),
    "msgWeakPassword" : MessageLookupByLibrary.simpleMessage("Password is too weak"),
    "msgWeakTooShort" : m2,
    "msgYouHavePushedTheButton" : MessageLookupByLibrary.simpleMessage("You have pushed the button this many times:")
  };
}
