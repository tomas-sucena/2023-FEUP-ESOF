import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../../models/volunteer.dart';

class DatabaseManager {
  final FirebaseFirestore _database;
  final FirebaseStorage _storage;

  /* CONSTRUCTOR */
  DatabaseManager()
      : _database = FirebaseFirestore.instance,
        _storage = FirebaseStorage.instance;

  /* METHODS */
  Future<Volunteer> getVolunteer(User? user) async {
    final documentSnapshot = await _database
        .collection("users")
        .doc(user?.email)
        .get();

    return (documentSnapshot.exists) ? Volunteer.fromFirestore(documentSnapshot.data()) : Volunteer.fromGoogle(user);
  }

  Future<void> addVolunteer(Volunteer volunteer) async {
    await _database
        .collection("users")
        .doc(volunteer.email)
        .set(volunteer.toJSON())
        .onError((e, _) => print("Error adding a new user: $e"));
  }

  Future<String> addFile(File file, String directory, {String? id}) async {
    String _id = id ?? DateTime.now().millisecondsSinceEpoch.toString();
    final _ref = _storage.ref().child(directory).child(_id);

    await _ref.putFile(file);
    return await _ref.getDownloadURL();
  }
}
