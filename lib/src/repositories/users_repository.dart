import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:starter_app/src/models/user_model.dart';
import 'package:starter_app/src/utils/constants.dart';

abstract class UsersRepositoryInterface {
  Future<UserModel> getUserFromID(String uid);
  Future<UserModel> getUserFromEmail(String email);
  Future<UserModel> setUser(
    String uid,
    String name,
    String email, [
    String photoUrl,
  ]);
  Future<bool> isNewUser(String uid);
}

class UsersRepository implements UsersRepositoryInterface {
  UsersRepository({Firestore firestoreService})
      : _firestoreService = firestoreService ?? Firestore.instance;

  final Firestore _firestoreService;

  @override
  Future<UserModel> getUserFromID(String uid) async {
    final DocumentReference ref = _firestoreService.collection(USERS_PATH).document(uid);
    final DocumentSnapshot snapshot = await ref.get();
    if (snapshot.exists) {
      final UserModel user = UserModel.fromJson(
        ref.documentID,
        snapshot.data,
      );
      return user;
    }
    return null;
  }

  @override
  Future<UserModel> getUserFromEmail(String email) async {
    final QuerySnapshot snapshot = await _firestoreService
        .collection(USERS_PATH)
        .where('email', isEqualTo: email)
        .limit(1)
        .getDocuments();
    if (snapshot.documents.length == 1) {
      final DocumentSnapshot document = snapshot.documents[0];
      final UserModel user = UserModel.fromJson(
        document.documentID,
        document.data,
      );
      return user;
    }
    return null;
  }

  @override
  Future<UserModel> setUser(
    String uid,
    String name,
    String email, [
    String photoUrl,
  ]) async {
    final DocumentReference ref = _firestoreService.collection(USERS_PATH).document(uid);
    final Map<String, dynamic> data = <String, dynamic>{
      'email': email,
      'name': name,
      'photoUrl': photoUrl,
      'createdAt': FieldValue.serverTimestamp(),
    };
    await ref.setData(data);
    final UserModel user = UserModel.fromJson(uid, data);
    return user;
  }

  @override
  Future<bool> isNewUser(String uid) async {
    final UserModel user = await getUserFromID(uid);
    return user == null;
  }
}
