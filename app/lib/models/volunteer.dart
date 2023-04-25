import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Volunteer {
  late String _name;
  late String _email;
  late String _phoneNumber;
  late String _photoURL;
  late int _eventsAttended;

  /* CONSTRUCTORS */
  Volunteer.fromGoogle(User? user) {
    if (user == null) throw Exception("The user does not contain any data!");

    // cannot be null
    _name = user.displayName!;
    _email = user.email!;

    // can be null
    _phoneNumber = user.phoneNumber ?? "";
    _photoURL = user.photoURL ?? "";

    _eventsAttended = 0;
  }

  Volunteer.fromFirestore(Map<String, dynamic>? data) {
    if (data == null)
      throw Exception("The document does not contain any data!");

    _name = data["name"];
    _email = data["email"];
    _phoneNumber = data["phoneNumber"];
    _eventsAttended = 0;
    _photoURL = data["photoURL"];
  }

  /* METHODS */
  get name => _name;
  get email => _email;
  get phoneNumber => _phoneNumber;
  get eventsAttended => _eventsAttended;
  get profilePicture => (_photoURL.isEmpty)
      ? Image.asset("assets/images/pedroanime.png")
      : Image.network(_photoURL);

  toJSON() {
    return {
      "name": _name,
      "email": _email,
      "phoneNumber": _phoneNumber,
      "photoURL": _photoURL
    };
  }
}
