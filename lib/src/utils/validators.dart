import 'package:email_validator/email_validator.dart';
import 'package:password_strength/password_strength.dart';

import '../configuration.dart';

class Validators {
  static bool isValidEmail(String email) => EmailValidator.validate(email.trim());

  static bool isValidPassword(String password) =>
      isValidPasswordLength(password) && isValidPasswordStrength(password);

  static bool isValidPasswordLength(String password) =>
      password.length >= kMinPasswordLength;

  static bool isValidPasswordStrength(String password) =>
      estimatePasswordStrength(password) >= kMinPasswordStrength;
}
