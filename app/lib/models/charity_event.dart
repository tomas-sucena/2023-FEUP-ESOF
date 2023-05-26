import 'package:flutter/material.dart';

class CharityEvent {
  late String _id;
  late String _name;
  late String _organizerID;
  late String _organizerName;
  late DateTime _date;
  late String _location;
  late String _email;
  late String _phoneNumber;
  late String _description;
  late NetworkImage _profilePicture;

  /* CONSTRUCTORS */
  CharityEvent(
      {String? id,
      required String name,
      required String organizerID,
      required String organizerName,
      required DateTime date,
      required String location,
      required String email,
      required String phoneNumber,
      required String description,
      required NetworkImage profilePicture})
      : _id = id ?? DateTime.now().millisecondsSinceEpoch.toString(),
        _name = name,
        _organizerID = organizerID,
        _organizerName = organizerName,
        _date = date,
        _location = location,
        _email = email,
        _phoneNumber = phoneNumber,
        _description = description,
        _profilePicture = profilePicture;

  CharityEvent.fromJSON(Map<String, dynamic>? data) {
    if (data == null)
      throw Exception("The database does not contain this event!");

    // cannot be null
    _id = data["id"];
    _name = data["name"];
    _organizerID = data["organizerID"];
    _organizerName = data["organizerName"];
    _date = DateTime(
      data["year"],
      data["month"],
      data["day"],
      data["hour"],
      data["minute"],
    );
    _location = data["location"];
    _email = data["email"];
    _phoneNumber = data["phoneNumber"];
    _description = data["description"];
    _profilePicture = NetworkImage(data["profilePictureURL"]);
  }

  /* METHODS */
  String get id => _id;
  String get name => _name;
  String get organizerID => _organizerID;
  String get organizerName => _organizerName;
  DateTime get date => _date;
  String get location => _location;
  String get email => _email;
  String get phoneNumber => _phoneNumber;
  String get description => _description;
  NetworkImage get profilePicture => _profilePicture;

  set profilePicture(NetworkImage profilePicture) =>
      _profilePicture = profilePicture;

  @override
  bool operator ==(other) => (other is CharityEvent) && (_id == other.id);

  Map<String, dynamic> toJSON() {
    return {
      "id": _id,
      "name": _name,
      "organizerID": _organizerID,
      "organizerName": _organizerName,
      "year": _date.year,
      "month": _date.month,
      "day": _date.day,
      "hour": _date.hour,
      "minute": _date.minute,
      "location": _location,
      "email": _email,
      "phoneNumber": _phoneNumber,
      "description": _description,
      "profilePictureURL": _profilePicture.url,
    };
  }
}
