import 'package:firebase_auth/firebase_auth.dart';

import 'authenticator.dart';

class EmailAuthenticator extends Authenticator {
  late String _email;
  late String _password;
  late String _name;

  /* CONSTRUCTOR */
  EmailAuthenticator(
      {required String email, required String password, String? name})
      : _email = email,
        _password = password,
        _name = name ?? "";

  /* METHODS */
  @override
  Future<String> signIn() async {
    try {
      auth.signInWithEmailAndPassword(
        email: _email,
        password: _password,
      );
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "user-not-found":
          return "Incorrect email!";
        case "wrong-password":
          return "Incorrect password!";
        default:
          return "Error signing in!";
      }
    }

    return "success";
  }

  Future<String> register() async {
    try {
      auth.createUserWithEmailAndPassword(
        email: _email,
        password: _password,
      );
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "user-not-found":
          return "Incorrect email!";
        case "wrong-password":
          return "Incorrect password!";
        default:
          return "Error signing in!";
      }
    }

    return "success";
  }
}
