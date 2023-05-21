import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../../models/my_event.dart';
import '../../models/volunteer.dart';

class DatabaseManager {
  final FirebaseFirestore _database;
  final FirebaseStorage _storage;

  /* CONSTRUCTOR */
  DatabaseManager()
      : _database = FirebaseFirestore.instance,
        _storage = FirebaseStorage.instance;

  /* METHODS */
  Future<Volunteer> getVolunteer(String id) async {
    final documentSnapshot = await _database.collection("users").doc(id).get();
    final data = documentSnapshot.data();

    if (!documentSnapshot.exists || data == null)
      throw Exception("The user with id $id does not exist!");

    return Volunteer.fromJSON(data);
  }

  Future<void> addVolunteer(Volunteer volunteer) async {
    _database
        .collection("users")
        .doc(volunteer.id)
        .set(volunteer.toJSON())
        .onError((e, _) => print("Error adding a new user: $e"));
  }

  Future<MyEvent> getEvent(String id) async {
    final documentSnapshot = await _database.collection("events").doc(id).get();
    final data = documentSnapshot.data();

    if (!documentSnapshot.exists || data == null)
      throw Exception("The event with id $id does not exist!");

    final MyEvent event = MyEvent.fromJSON(data);
    event.organizer = await getVolunteer(data["organizerId"]);

    return event;
  }

  Future<void> addEvent(MyEvent event) async {
    _database
        .collection("users")
        .doc(event.id)
        .set(event.toJSON())
        .onError((e, _) => print("Error adding a new user: $e"));
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
