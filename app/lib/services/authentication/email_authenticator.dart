import 'package:app/services/data/database_manager.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../models/volunteer.dart';
import 'authenticator.dart';

class EmailAuthenticator extends Authenticator {
  final String _email;
  final String _password;
  final String _repeatedPassword;
  final String _name;

  /* CONSTRUCTOR */
  EmailAuthenticator(
      {required String email,
      required String password,
      String? repeatedPassword,
      String? name})
      : _email = email,
        _password = password,
        _repeatedPassword = repeatedPassword ?? "",
        _name = name ?? "";

  /* METHODS */
  Future<void> _updateDatabase() async {
    DatabaseManager().addVolunteer(
      Volunteer.fromJSON({
        "name": _name,
        "email": _email,
      }),
    );
  }

  @override
  Future<String> signIn() async {
    try {
      await auth.signInWithEmailAndPassword(
        email: _email,
        password: _password,
      );
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "invalid-email":
          return "Invalid email!";
        case "user-not-found":
          return "There is no user with that email!";
        case "wrong-password":
          return "Incorrect password!";
        default:
          return "Error signing in!";
      }
    }

    return "success";
  }

  Future<String> register() async {
    if (_password != _repeatedPassword) return "The passwords do not match!";

    if (_name.length > 18) return "Name is too long!";

    try {
      await auth.createUserWithEmailAndPassword(
        email: _email,
        password: _password,
      );
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "email-already-in-use":
          return "The email provided is already being used!";
        case "invalid-email":
          return "Invalid email!";
        case "weak-password":
          return "The password provided is too weak!";
        default:
          return "Error signing in!";
      }
    }

    await _updateDatabase();
    return "success";
  }
}
