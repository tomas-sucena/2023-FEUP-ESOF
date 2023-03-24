import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// pages
import 'package:app/pages/home_page.dart';
import 'package:app/pages/login_page.dart';

abstract class Authenticator {
  // sign in
  signIn();

  // handle state
  getAuthState() {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData)
          return HomePage();

        return LoginPage();
      }
    );
  }

  // sign out
  void signOut(){
    FirebaseAuth.instance.signOut();
  }
}
