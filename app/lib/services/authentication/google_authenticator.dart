import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'auth.dart';

class GoogleAuth extends Auth {
  @override
  signIn() async {
    // get Google account
    final GoogleSignInAccount? user = await GoogleSignIn(
      scopes: <String>["email"]).signIn();

    // obtain the authentication details
    final GoogleSignInAuthentication userAuth = await user!.authentication;

    // create a new credential
    final OAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: userAuth.accessToken,
      idToken: userAuth.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
