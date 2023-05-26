import 'package:app/services/data/database_manager.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../models/volunteer.dart';
import 'authenticator.dart';

class GoogleAuthenticator extends Authenticator {
  final DatabaseManager _dbManager;

  /* CONSTRUCTOR */
  GoogleAuthenticator({DatabaseManager? dbManager})
      : _dbManager = dbManager ?? DatabaseManager();

  /* METHODS */
  @override
  void signIn() async {
    // get Google account
    final GoogleSignInAccount? googleSignInAccount =
        await GoogleSignIn(scopes: <String>["email"]).signIn();

    // obtain the authentication details
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount!.authentication;

    // create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    // sign in
    await auth.signInWithCredential(credential);
  }
}
