import 'package:email_validator/email_validator.dart';
import 'package:flutter_auth/src/configuration.dart';
import 'package:password_strength/password_strength.dart';

bool isValidName(String name) => name.trim().isNotEmpty;

bool isValidEmail(String email) =>
    email.trim().isNotEmpty && EmailValidator.validate(email);

bool isValidPassword(String password) =>
    isValidPasswordLength(password) && isValidPasswordStrength(password);

bool isValidPasswordLength(String password) =>
    password.trim().length >= kMinPasswordLength;

bool isValidPasswordStrength(String password) =>
    estimatePasswordStrength(password) >= kMinPasswordStrength;
