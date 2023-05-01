import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Volunteer {
  late String _name;
  late String _email;
  late String _phoneNumber;
  late Image _profilePicture;
  late int _eventsAttended;

  /* CONSTRUCTORS */
  Volunteer.fromGoogle(User? user) {
    if (user == null) throw Exception("The user does not contain any data!");

    // cannot be null
    _name = user.displayName!;
    _email = user.email!;

    // can be null
    _phoneNumber = user.phoneNumber ?? "";
    _profilePicture = (user.photoURL == null)
        ? Image.asset("assets/images/pedroanime.png")
        : Image.network(user.photoURL!);

    _eventsAttended = 0;
  }

  Volunteer.fromFirestore(Map<String, dynamic>? data) {
    if (data == null)
      throw Exception("The document does not contain any data!");

    _name = data["name"];
    _email = data["email"];
    _phoneNumber = data["phoneNumber"];
    _profilePicture = data["profilePicture"];
    _eventsAttended = 0;
  }

  /* METHODS */
  String get name => _name;
  String get email => _email;
  String get phoneNumber => _phoneNumber;
  Image get profilePicture => _profilePicture;
  int get eventsAttended => _eventsAttended;

  set profilePicture(Image profilePicture) => _profilePicture = profilePicture;

  toJSON() {
    return {
      "name": _name,
      "email": _email,
      "phoneNumber": _phoneNumber,
      "profilePicture": _profilePicture,
    };
  }
}
