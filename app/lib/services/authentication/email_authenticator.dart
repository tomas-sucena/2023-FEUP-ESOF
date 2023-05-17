import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'authenticator.dart';

class EmailAuthenticator extends StatefulWidget implements Authenticator {
  final FirebaseAuth _auth;

  /* CONSTRUCTOR */
  EmailAuthenticator({Key? key}) : _auth = FirebaseAuth.instance, super(key: key);

  /* METHODS */
  @override
  State<EmailAuthenticator> createState() => _EmailAuthenticatorState();

  @override
  signIn() async {
    // get Google account
    final GoogleSignInAccount? user =
    await GoogleSignIn(scopes: <String>["email"]).signIn();

    // obtain the authentication details
    final GoogleSignInAuthentication userAuth = await user!.authentication;

    // create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: userAuth.accessToken,
      idToken: userAuth.idToken,
    );

    // sign in
    return await _auth.signInWithCredential(credential);
  }

  @override
  void signOut() async {
    _auth.signOut();
  }
}

class _EmailAuthenticatorState extends State<EmailAuthenticator> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
