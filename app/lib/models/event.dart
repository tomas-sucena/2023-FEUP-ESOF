import 'volunteer.dart';

class MyEvent {
  late String _id;
  late String _name;
  late Volunteer _organizer;
  late DateTime _date;
  late String _location;
  late String _email;
  late String _phoneNumber;
  late String _description;

  /* CONSTRUCTORS */
  MyEvent(
      {String? id,
      required String name,
      required Volunteer organizer,
      required DateTime date,
      required String location,
      required String email,
      required String phoneNumber,
      required String description})
      : _id = id ?? DateTime.now().millisecondsSinceEpoch.toString(),
        _name = name,
        _organizer = organizer,
        _date = date,
        _location = location,
        _email = email,
        _phoneNumber = phoneNumber,
        _description = description;

  MyEvent.fromJSON(Map<String, dynamic>? data) {
    if (data == null)
      throw Exception("The database does not contain this event!");

    // cannot be null
    _id = data["id"];
    _name = data["name"];
    _date = DateTime(
      data["year"],
      data["month"],
      data["day"],
      data["hour"],
      data["minutes"],
    );
    _email = data["email"];
    _phoneNumber = data["phoneNumber"];
    _description = data["description"];
  }

  /* METHODS */
  String get id => _id;
  String get name => _name;
  Volunteer get organizer => _organizer;
  DateTime get date => _date;
  String get location => _location;
  String get email => _email;
  String get phoneNumber => _phoneNumber;
  String get description => _description;

  set organizer(Volunteer organizer) => _organizer = organizer;

  Map<String, dynamic> toJSON() {
    return {
      "name": _name,
      "organizerId": _organizer.id,
      "location": _location,
      "email": _email,
      "phoneNumber": _phoneNumber,
      "description": _description,
    };
  }
}
