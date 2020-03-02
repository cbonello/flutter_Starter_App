import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:starter_app/src/models/user_model.dart';
import 'package:starter_app/src/repositories/users_repository.dart';
import 'package:starter_app/src/utils/exceptions.dart';

abstract class AuthenticationRepositoryInterface {
  Future<UserModel> signInWithCurrentUser();
  Future<UserModel> signInWithEmailAndPassword({String email, String password});
  Future<UserModel> signInWithGoogle({Function newUserHandler});
  Future<UserModel> signUp({String name, String email, String password});
  Future<void> signOut();
}

class AuthenticationRepository implements AuthenticationRepositoryInterface {
  AuthenticationRepository({
    FirebaseAuth firebaseAuth,
    GoogleSignIn googleSignin,
    @required UsersRepository usersRepository,
  })  : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
        _googleSignIn = googleSignin ?? GoogleSignIn(),
        _usersRepository = usersRepository;

  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;
  final UsersRepository _usersRepository;

  @override
  Future<UserModel> signInWithCurrentUser() async {
    final FirebaseUser firebaseUser = await _firebaseAuth.currentUser();
    if (firebaseUser != null) {
      try {
        final UserModel user = await _usersRepository.getUserFromID(firebaseUser.uid);
        return user;
      } catch (_) {
        await signOut();
      }
    }
    return null;
  }

  @override
  Future<UserModel> signInWithEmailAndPassword({String email, String password}) async {
    AuthResult authResult;
    try {
      authResult = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (authResult.user.isEmailVerified == false) {
        throw AppException.fromCode('ERROR_EMAIL_NOT_VERIFIED');
      }
    } catch (exception) {
      throw AppException.from(exception);
    }
    try {
      final FirebaseUser firebaseUser = authResult.user;
      final UserModel user = await _usersRepository.getUserFromID(firebaseUser.uid);
      if (user == null) {
        _throwError(
          code: 'ERROR_USER_NOT_FOUND',
          message: 'A signed in user is not registered in the "/users" collection',
          extras: <String, String>{
            'name': firebaseUser.displayName,
            'email': email,
            'photoUrl': firebaseUser.photoUrl ?? '',
          },
        );
      }
      return user;
    } catch (exception) {
      await signOut();
      throw AppException.from(exception);
    }
  }

  @override
  Future<UserModel> signInWithGoogle({Function newUserHandler}) async {
    AuthResult authResult;
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
      authResult = await _firebaseAuth.signInWithCredential(
        credential,
      );
    } catch (exception) {
      throw AppException.from(exception);
    }
    try {
      final FirebaseUser firebaseUser = authResult.user;
      UserModel user = await _usersRepository.getUserFromID(firebaseUser.uid);
      if (user == null && newUserHandler != null) {
        newUserHandler();
      }
      user ??= await _usersRepository.setUser(
        firebaseUser.uid,
        firebaseUser.displayName,
        firebaseUser.email,
        firebaseUser.photoUrl,
      );
      return user;
    } catch (exception) {
      await signOut();
      throw AppException.from(exception);
    }
  }

  @override
  Future<UserModel> signUp({String name, String email, String password}) async {
    AuthResult authResult;
    try {
      authResult = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // await authResult.user.sendEmailVerification();
    } catch (exception) {
      throw AppException.from(exception);
    }
    try {
      final FirebaseUser firebaseUser = authResult.user;
      if (await _usersRepository.isNewUser(firebaseUser.uid) == false) {
        throw const AppException('ERROR_EMAIL_ALREADY_IN_USE');
      }
      final UserModel user = await _usersRepository.setUser(
        firebaseUser.uid,
        name,
        email,
        firebaseUser.photoUrl,
      );
      return user;
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

  void _throwError({
    @required String code,
    @required String message,
    Map<String, String> extras,
  }) {
    throw AppException.fromCode(code);
  }
}
