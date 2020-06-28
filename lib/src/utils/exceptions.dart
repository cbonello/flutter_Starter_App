import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'utils.dart';

class AppException implements Exception {
  const AppException({@required this.code});

  factory AppException.from(Exception exception) {
    if (exception is AppException) {
      return exception;
    }
    if (exception is PlatformException) {
      return AppException(code: exception.code);
    }

    return const AppException(code: 'ERROR_UNKNOWN');
  }

  String message(BuildContext context) {
    switch (code) {
      // Internal.
      case 'ERROR_SiGN_IN_CANCEL':
        return context.l10n().msgCancelled;
      // Firebase Authentication: signInWithEmailAndPassword(), sendPasswordResetEmail().
      case 'ERROR_EMAIL_ALREADY_IN_USE':
        return context.l10n().msgErrorEmailAlreadyRegistered;
      case 'ERROR_INVALID_EMAIL':
        return context.l10n().msgErrorMalformedEmailAddress;
      case 'ERROR_WRONG_PASSWORD':
        return context.l10n().msgErrorWrongPassword;
      case 'ERROR_USER_NOT_FOUND':
        return context.l10n().msgErrorInvalidEmailAddress;
      case 'ERROR_USER_DISABLED':
        return context.l10n().msgErrorAccountHasBeenDisabled;
      case 'ERROR_TOO_MANY_REQUESTS':
        return context.l10n().msgErrorTooManySignInAttempts;
      case 'ERROR_EMAIL_NOT_VERIFIED':
        return context.l10n().msgErrorEmailAddressIsNotVerified;
      // Firebase Authentication: signInWithCredential().
      case 'ERROR_INVALID_CREDENTIAL':
        return context.l10n().msgErrorInvalidCredential;
      case 'ERROR_ACCOUNT_EXISTS_WITH_DIFFERENT_CREDENTIAL':
        return context.l10n().msgErrorAccountExistsWithDifferentCredential;
      case 'ERROR_OPERATION_NOT_ALLOWED':
        return context.l10n().msgErrorGoogleAccountsAreDisabled;
      // Firebase Authentication: createUserWithEmailAndPassword().
      case 'ERROR_WEAK_PASSWORD':
        return context.l10n().msgErrorPasswordNotStrongEnough;
      case 'ERROR_NETWORK_REQUEST_FAILED':
      case 'sign_in_failed':
      case 'FirebaseException':
        return context.l10n().msgErrorNoInternetConnection;
      default:
        return context.l10n().msgErrorUnknown;
    }
  }

  final String code;

  @override
  String toString() => 'AppException("$code")';
}
