import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';

class UserModel extends Equatable {
  const UserModel({
    @required this.userID,
    @required this.name,
    @required this.email,
    // New users who signed up with email and password don't have a profile picture.
    this.photoUrl,
  })  : assert(userID != null),
        assert(name != null),
        assert(email != null);

  factory UserModel.fromJson(String userID, Map<String, dynamic> json) {
    return UserModel(
      userID: userID,
      name: json['name'],
      email: json['email'],
      photoUrl: json['photoUrl'],
    );
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'userID': userID,
        'name': name,
        'email': email,
        'photoUrl': photoUrl,
      };

  final String name, email, userID, photoUrl;

  @override
  List<Object> get props => <Object>[name, email, userID, photoUrl];

  @override
  String toString() {
    return '''UserModel {
      userID: "$userID",
      email: "$email",
      name: "$name",
      photoUrl: "#$photoUrl",
    }''';
  }
}
