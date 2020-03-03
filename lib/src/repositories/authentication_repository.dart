import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:starter_app/src/utils/exceptions.dart';

abstract class AuthenticationRepositoryInterface {
  Future<FirebaseUser> signInWithCurrentUser();
  Future<FirebaseUser> signInWithEmailAndPassword({String email, String password});
  Future<FirebaseUser> signInWithGoogle({Function newUserHandler});
  Future<FirebaseUser> signUp({String email, String password});
  Future<void> signOut();
  Future<void> resetPassword(String email);
}

class AuthenticationRepository implements AuthenticationRepositoryInterface {
  AuthenticationRepository({
    FirebaseAuth firebaseAuth,
    GoogleSignIn googleSignin,
  })  : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
        _googleSignIn = googleSignin ?? GoogleSignIn();

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
      return firebaseUser;
    } catch (exception) {
      throw AppException.from(exception);
    }
  }

  @override
  Future<FirebaseUser> signInWithGoogle({Function newUserHandler}) async {
    try {
      final GoogleSignInAccount account = await _googleSignIn.signIn();
      if (account == null) {
        throw AppException.fromCode('ERROR_SiGN_IN_CANCEL');
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
      throw AppException.from(exception);
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
      return firebaseUser;
    } catch (exception) {
      throw AppException.from(exception);
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await Future.wait<void>(<Future<void>>[
        _firebaseAuth.signOut(),
        _googleSignIn.signOut(),
      ]);
    } catch (_, stacktrace) {
      // TODO(cbonello): handle exception.
      print(stacktrace);
    }
  }

  @override
  Future<void> resetPassword(String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } catch (exception, stacktrace) {
      print(stacktrace);
      throw AppException.from(exception);
    }
  }
}
