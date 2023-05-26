import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'charity_event.dart';

class Volunteer {
  late String _id;
  late String _name;
  late String _email;
  late String? _phoneNumber;
  late NetworkImage _profilePicture;
  late bool _isOrganizer;
  late List<CharityEvent> _organizedEvents;
  late List<CharityEvent> _favoriteEvents;

  static final String _defaultProfilePictureURL =
      "https://icon-library.com/images/default-profile-icon/default-profile-icon-24.jpg";

  /* CONSTRUCTORS */
  Volunteer.fromFirebaseAuth(User? user) {
    if (user == null) throw Exception("The user does not contain any data!");

    // cannot be null
    _id = user.uid;
    _name = user.displayName!;
    _email = user.email!;
    _profilePicture = NetworkImage(user.photoURL!);

    // can be null
    _phoneNumber = user.phoneNumber ?? "(NOT SPECIFIED)";
    _isOrganizer = false;

    _organizedEvents = [];
    _favoriteEvents = [];
  }

  Volunteer.fromJSON(Map<String, dynamic> data) {
    // cannot be null
    _id = data["id"];
    _name = data["name"];
    _email = data["email"];
    _phoneNumber = data["phoneNumber"];

    // can be null
    _profilePicture =
        NetworkImage(data["profilePictureURL"] ?? _defaultProfilePictureURL);
    _isOrganizer = data["isOrganizer"] ?? false;

    _organizedEvents = [];
    _favoriteEvents = [];
  }

  /* METHODS */
  String get id => _id;
  String get name => _name;
  String get email => _email;
  String? get phoneNumber => _phoneNumber;
  NetworkImage get profilePicture => _profilePicture;
  bool get isOrganizer => _isOrganizer;
  List<CharityEvent> get organizedEvents => _organizedEvents;
  List<CharityEvent> get favoriteEvents => _favoriteEvents;

  set profilePicture(NetworkImage profilePicture) =>
      _profilePicture = profilePicture;

  @override
  bool operator ==(other) => (other is Volunteer) && (_id == other.id);

  Map<String, dynamic> toJSON() {
    List<String> organizedEventIDs = [];
    for (CharityEvent event in _organizedEvents)
      organizedEventIDs.add(event.id);

    List<String> favoriteEventIDs = [];
    for (CharityEvent event in _favoriteEvents) favoriteEventIDs.add(event.id);

    return {
      "id": _id,
      "name": _name,
      "email": _email,
      "phoneNumber": _phoneNumber,
      "profilePictureURL": _profilePicture.url,
      "isOrganizer": _isOrganizer,
      "organizedEvents": organizedEventIDs,
      "favoriteEvents": favoriteEventIDs,
    };
  }
}
