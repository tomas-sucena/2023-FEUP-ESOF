import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'authenticator.dart';

class GoogleAuthenticator implements Authenticator {
  final FirebaseAuth _auth;

  /* CONSTRUCTOR */
  GoogleAuthenticator() : _auth = FirebaseAuth.instance;

  /* METHODS */
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
