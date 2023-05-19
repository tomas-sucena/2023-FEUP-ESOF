import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'authenticator.dart';

class GoogleAuthenticator extends Authenticator {
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
    await auth.signInWithCredential(credential);
  }
}
