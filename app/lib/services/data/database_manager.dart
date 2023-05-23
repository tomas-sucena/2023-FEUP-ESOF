import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../../models/charity_event.dart';
import '../../models/volunteer.dart';

class DatabaseManager {
  final FirebaseFirestore _database;
  final FirebaseStorage _storage;

  /* CONSTRUCTOR */
  DatabaseManager()
      : _database = FirebaseFirestore.instance,
        _storage = FirebaseStorage.instance;

  /* METHODS */
  Future<Volunteer> _parseVolunteerData(Map<String, dynamic> data) async {
    final Volunteer volunteer = Volunteer.fromJSON(data);

    for (String eventID in data["organizedEvents"])
      volunteer.organizedEvents.add(await getEvent(eventID));

    for (String eventID in data["favoriteEvents"])
      volunteer.favoriteEvents.add(await getEvent(eventID));

    return volunteer;
  }

  Future<Volunteer> getVolunteer(String id) async {
    final documentSnapshot = await _database.collection("users").doc(id).get();
    final data = documentSnapshot.data();

    if (!documentSnapshot.exists || data == null)
      throw Exception("The user with id $id does not exist!");

    return await _parseVolunteerData(data);
  }

  Future<void> addVolunteer(Volunteer volunteer) async {
    _database
        .collection("users")
        .doc(volunteer.id)
        .set(volunteer.toJSON())
        .onError((e, _) => print("Error adding a new user: $e"));
  }

  Future<CharityEvent> getEvent(String id) async {
    final documentSnapshot = await _database.collection("events").doc(id).get();
    final data = documentSnapshot.data();

    if (!documentSnapshot.exists || data == null)
      throw Exception("The event with id $id does not exist!");

    return CharityEvent.fromJSON(data);
  }

  Future<void> addEvent(CharityEvent event) async {
    _database
        .collection("events")
        .doc(event.id)
        .set(event.toJSON())
        .onError((e, _) => print("Error adding a new event: $e"));
  }

  Future<List<CharityEvent>> getEvents() async {
    final querySnapshots = await _database.collection("events")
                                      .limit(20)
                                      .get();

    final List<CharityEvent> recentEvents = [];
    for (var documentSnapshot in querySnapshots.docs)
      recentEvents.add(CharityEvent.fromJSON(documentSnapshot.data()));

    return recentEvents;
  }

  Future<String> addFile(File file, String directory, {String? id}) async {
    id = id ?? DateTime.now().millisecondsSinceEpoch.toString();
    final ref = _storage.ref().child(directory).child(id);

    await ref.putFile(file);
    return ref.getDownloadURL();
  }

  Future<void> removeFile(String fileURL) async {
    _storage
        .refFromURL(fileURL)
        .delete()
        .onError((e, _) => print("Error deleting a file: $e"));
  }
}
