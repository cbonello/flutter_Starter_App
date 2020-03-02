import 'package:email_validator/email_validator.dart';
import 'package:password_strength/password_strength.dart';
import 'package:starter_app/src/utils/constants.dart';

bool isValidName(String name) => name.trim().isNotEmpty;

bool isValidEmail(String email) =>
    email.trim().isNotEmpty && EmailValidator.validate(email);

bool isValidPassword(String password) =>
    isValidPasswordLength(password) && isValidPasswordStrength(password);

bool isValidPasswordLength(String password) =>
    password.trim().length >= MIN_PASSWORD_LENGTH;

bool isValidPasswordStrength(String password) =>
    estimatePasswordStrength(password) >= MIN_PASSWORD_STRENGTH;
