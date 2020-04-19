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
    "msgDontHaveAccount" : MessageLookupByLibrary.simpleMessage("Don\'t have an account?"),
    "msgEmail" : MessageLookupByLibrary.simpleMessage("Email"),
    "msgEnterValidEmail" : MessageLookupByLibrary.simpleMessage("Enter a valid email address"),
    "msgEnterYourName" : MessageLookupByLibrary.simpleMessage("Enter your name"),
    "msgError" : MessageLookupByLibrary.simpleMessage("Error"),
    "msgFirstName" : MessageLookupByLibrary.simpleMessage("First Name"),
    "msgForgotPasswprd" : MessageLookupByLibrary.simpleMessage("Forgot Password?"),
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
    "msgToS" : MessageLookupByLibrary.simpleMessage("I agree to the Terms of Services and Privacy Policy"),
    "msgWeakPassword" : MessageLookupByLibrary.simpleMessage("Password is too weak"),
    "msgWeakTooShort" : m2
  };
}
