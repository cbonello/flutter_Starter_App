import 'package:flutter/services.dart';

class AppException implements Exception {
  const AppException(this.message);

  factory AppException.from(Exception exception) {
    if (exception is AppException) {
      return exception;
    }

    if (exception is PlatformException) {
      return AppException.fromCode(exception.code);
    }

    return AppException.fromCode('ERROR_UNKNOWN');
  }

  factory AppException.fromCode(String code) {
    switch (code) {
      // Internal.
      case 'ERROR_SiGN_IN_CANCEL':
        return const AppException('Cancelled');
      // Firebase Authentication: signInWithEmailAndPassword().
      case 'ERROR_EMAIL_ALREADY_IN_USE':
        return const AppException('Email is already registered');
      case 'ERROR_INVALID_EMAIL':
        return const AppException('Malformed email address');
      case 'ERROR_WRONG_PASSWORD':
        return const AppException('Wrong password');
      case 'ERROR_USER_NOT_FOUND':
        return const AppException('Invalid email address');
      case 'ERROR_USER_DISABLED':
        return const AppException('Account has been disabled');
      case 'ERROR_TOO_MANY_REQUESTS':
        return const AppException(
          'Too many sign in attempts, try again later',
        );
      case 'ERROR_EMAIL_NOT_VERIFIED':
        return const AppException('Email address is not verified');
      // Firebase Authentication: signInWithCredential().
      case 'ERROR_INVALID_CREDENTIAL':
        return const AppException('Invalid credential');
      case 'ERROR_ACCOUNT_EXISTS_WITH_DIFFERENT_CREDENTIAL':
        return const AppException('Account already exists with different credential');
      case 'ERROR_OPERATION_NOT_ALLOWED':
        return const AppException('Google accounts are disabled');
      case 'ERROR_NETWORK_REQUEST_FAILED':
        return const AppException('No Internet connection');
      // Firebase Authentication: createUserWithEmailAndPassword().
      case 'ERROR_WEAK_PASSWORD':
        return const AppException('Password is not strong enough');
      case 'sign_in_failed':
      case 'FirebaseException':
        return const AppException('No Internet connection');
      default:
        return const AppException('Unknown error');
    }
  }

  final String message;

  @override
  String toString() => 'AppException($message)';
}
