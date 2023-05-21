import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Volunteer {
  late String _id;
  late String _name;
  late String _email;
  late String? _phoneNumber;
  late NetworkImage _profilePicture;
  late int _eventsAttended;

  static final String _defaultProfilePictureURL =
      "https://i.pinimg.com/736x/c2/cf/2d/c2cf2dc539707a77ca40b8afe64ab1c1--pikachu-raichu-cute-pikachu.jpg";

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

  Volunteer.fromJSON(Map<String, dynamic> data) {
    // cannot be null
    _id = data["id"];
    _name = data["name"];
    _email = data["email"];

    // can be null
    _phoneNumber = data["phoneNumber"];
    _profilePicture =
        NetworkImage(data["profilePictureURL"] ?? _defaultProfilePictureURL);

    _eventsAttended = 0;
  }

  /* METHODS */
  String get id => _id;
  String get name => _name;
  String get email => _email;
  String? get phoneNumber => _phoneNumber;
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
