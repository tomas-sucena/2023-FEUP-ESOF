import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Volunteer {
  late String _id;
  late String _name;
  late String _email;
  late String _phoneNumber;
  late NetworkImage _profilePicture;
  late int _eventsAttended;

  /* CONSTRUCTORS */
  Volunteer.fromGoogle(User? user) {
    if (user == null) throw Exception("The user does not contain any data!");

    // cannot be null
    _id = user.uid;
    _name = user.displayName!;
    _email = user.email!;
    _profilePicture = NetworkImage(user.photoURL!);

    // can be null
    _phoneNumber = user.phoneNumber ?? "";

    _eventsAttended = 0;
  }

  Volunteer.fromFirestore(Map<String, dynamic>? data) {
    if (data == null)
      throw Exception("The database does not contain this user!");

    _id = data["id"];
    _name = data["name"];
    _email = data["email"];
    _phoneNumber = data["phoneNumber"];
    _profilePicture = NetworkImage(data["profilePictureURL"]);
    _eventsAttended = 0;
  }

  /* METHODS */
  String get id => _id;
  String get name => _name;
  String get email => _email;
  String get phoneNumber => _phoneNumber;
  NetworkImage get profilePicture => _profilePicture;
  int get eventsAttended => _eventsAttended;

  set profilePicture(NetworkImage profilePicture) =>
      _profilePicture = profilePicture;

  Map<String, dynamic> toJSON() {
    return {
      "id": _id,
      "name": _name,
      "email": _email,
      "phoneNumber": _phoneNumber,
      "profilePictureURL": _profilePicture.url,
    };
  }
}
