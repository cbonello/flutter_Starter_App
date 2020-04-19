// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a fr_FR locale. All the
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
  String get localeName => 'fr_FR';

  static m0(email) => "Un e-mail de vérification de compte a été envoyé à ${email} avec des instructions sur la façon de vérifier l\'adresse e-mail.";

  static m1(email) => "Un e-mail de réinitialisation du mot de passe a été envoyé à ${email}.";

  static m2(minLength) => "Le mot de passe est trop court (8 caractères minimum)";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "msgAccountVerification" : MessageLookupByLibrary.simpleMessage("Vérification du compte"),
    "msgAccountVerificationExplanation" : m0,
    "msgAlreadyHaveAccount" : MessageLookupByLibrary.simpleMessage("Vous avez déjà un compte ?"),
    "msgDontHaveAccount" : MessageLookupByLibrary.simpleMessage("Pas de compte?"),
    "msgEmail" : MessageLookupByLibrary.simpleMessage("Adresse mail"),
    "msgEnterValidEmail" : MessageLookupByLibrary.simpleMessage("Entrez une adresse mail valide"),
    "msgEnterYourName" : MessageLookupByLibrary.simpleMessage("Entrez votre nom"),
    "msgError" : MessageLookupByLibrary.simpleMessage("Erreur"),
    "msgFirstName" : MessageLookupByLibrary.simpleMessage("Prénom"),
    "msgForgotPasswprd" : MessageLookupByLibrary.simpleMessage("Mot de passe oublié ?"),
    "msgName" : MessageLookupByLibrary.simpleMessage("Nom"),
    "msgOk" : MessageLookupByLibrary.simpleMessage("OK"),
    "msgOr" : MessageLookupByLibrary.simpleMessage("ou"),
    "msgPassword" : MessageLookupByLibrary.simpleMessage("Mot de passe"),
    "msgPasswordReset" : MessageLookupByLibrary.simpleMessage("Réinitialisation du mot de passe"),
    "msgPasswordResetFailure" : MessageLookupByLibrary.simpleMessage("Échec de la réinitialisation du mot de passe"),
    "msgPasswordResetSent" : m1,
    "msgSendingPasswordResetEmail" : MessageLookupByLibrary.simpleMessage("Envoi d\'un e-mail de réinitialisation du mot de passe..."),
    "msgSignIn" : MessageLookupByLibrary.simpleMessage("Se connecter"),
    "msgSignInFailure" : MessageLookupByLibrary.simpleMessage("Échec de la connexion"),
    "msgSignOut" : MessageLookupByLibrary.simpleMessage("Déconnexion"),
    "msgSignUp" : MessageLookupByLibrary.simpleMessage("S\'inscrire"),
    "msgSignUpFailure" : MessageLookupByLibrary.simpleMessage("Échec de l\'inscription"),
    "msgSigningIn" : MessageLookupByLibrary.simpleMessage("Connexion..."),
    "msgSigningUp" : MessageLookupByLibrary.simpleMessage("Enregistrement..."),
    "msgSubmit" : MessageLookupByLibrary.simpleMessage("Envoyer"),
    "msgToS" : MessageLookupByLibrary.simpleMessage("J\'accepte les conditions d\'utilisation et la politique de confidentialité"),
    "msgWeakPassword" : MessageLookupByLibrary.simpleMessage("Le mot de passe est trop simple"),
    "msgWeakTooShort" : m2
  };
}
