import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../configuration.dart';
import '../utils/utils.dart';

abstract class AuthenticationRepositoryInterface {
  Future<FirebaseUser> signInWithCurrentUser();
  Future<FirebaseUser> signInWithEmailAndPassword({String email, String password});
  Future<FirebaseUser> signInWithGoogle({Function newUserHandler});
  Future<FirebaseUser> signUp({String email, String password});
  Future<void> sendEmailVerification({FirebaseUser user});
  Future<void> signOut();
  Future<void> sendPasswordResetEmail({String email});
}

class AuthenticationRepository implements AuthenticationRepositoryInterface {
  AuthenticationRepository({
    FirebaseAuth firebaseAuth,
    GoogleSignIn googleSignin,
  })  : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
        _googleSignIn = googleSignin ?? GoogleSignIn(scopes: <String>['email']);

  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  @override
  Future<FirebaseUser> signInWithCurrentUser() async {
    final FirebaseUser firebaseUser = await _firebaseAuth.currentUser();
    return firebaseUser;
  }

  @override
  Future<FirebaseUser> signInWithEmailAndPassword({String email, String password}) async {
    try {
      final AuthResult authResult = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final FirebaseUser firebaseUser = authResult.user;
      if (firebaseUser.isEmailVerified == false) {
        throw const AppException(code: 'ERROR_EMAIL_NOT_VERIFIED');
      }
      return firebaseUser;
    } catch (exception) {
      throw AppException.from(exception as Exception);
    }
  }

  @override
  Future<FirebaseUser> signInWithGoogle({Function newUserHandler}) async {
    try {
      final GoogleSignInAccount account = await _googleSignIn.signIn();
      if (account == null) {
        throw const AppException(code: 'ERROR_SiGN_IN_CANCEL');
      }
      final GoogleSignInAuthentication auth = await account.authentication;
      final AuthCredential credential = GoogleAuthProvider.getCredential(
        idToken: auth.idToken,
        accessToken: auth.accessToken,
      );
      final AuthResult authResult = await _firebaseAuth.signInWithCredential(credential);
      final FirebaseUser firebaseUser = authResult.user;
      return firebaseUser;
    } catch (exception) {
      await signOut();
      throw AppException.from(exception as Exception);
    }
  }

  @override
  Future<FirebaseUser> signUp({String email, String password}) async {
    try {
      final AuthResult authResult = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final FirebaseUser firebaseUser = authResult.user;
      await sendEmailVerification(user: firebaseUser);
      return firebaseUser;
    } catch (exception) {
      throw AppException.from(exception as Exception);
    }
  }

  @override
  Future<void> sendEmailVerification({FirebaseUser user}) async {
    try {
      user.sendEmailVerification();
    } catch (exception) {
      throw AppException.from(exception as Exception);
    }
  }

  @override
  Future<void> signOut() async {
    try {
      if (kUseGoogleASignIn) {
        await Future.wait<void>(<Future<void>>[
          _firebaseAuth.signOut(),
          _googleSignIn.signOut(),
        ]);
      } else {
        await _firebaseAuth.signOut();
      }
    } catch (_) {}
  }

  @override
  Future<void> sendPasswordResetEmail({String email}) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } catch (exception) {
      throw AppException.from(exception as Exception);
    }
  }
}
