import 'package:flutter/material.dart';

class Event {
  late String _name;
  late String _organizer;
  late String _location;
  late String _email;
  late String _phoneNumber;
  late NetworkImage _profilePicture;
  late String _description;

  /* CONSTRUCTORS */
  Event(String name, String organizer, String location, String email,
      String phoneNumber, String profilePictureURL, String description)
      : _name = name,
        _organizer = organizer,
        _location = location,
        _email = email,
        _phoneNumber = phoneNumber,
        _profilePicture = NetworkImage(profilePictureURL),
        _description = description;

  /* METHODS */
  String get name => _name;
  String get organizer => _organizer;
  String get location => _location;
  String get email => _email;
  String get phoneNumber => _phoneNumber;
  NetworkImage get profilePicture => _profilePicture;
  String get description => _description;

  toJSON() {
    return {
      "name": _name,
      "organizer": _organizer,
      "location": _location,
      "email": _email,
      "phoneNumber": _phoneNumber,
      "profilePictureURL": _profilePicture.url,
      "description": _description,
    };
  }
}
