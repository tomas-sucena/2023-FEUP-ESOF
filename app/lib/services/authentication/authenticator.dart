import 'package:firebase_auth/firebase_auth.dart';

abstract class Authenticator {
  final FirebaseAuth _auth;

  /* CONSTRUCTOR */
  Authenticator() : _auth = FirebaseAuth.instance;

  /* METHODS */
  FirebaseAuth get auth => _auth;

  signIn();
  void signOut() async {
    _auth.signOut();
  }
}
