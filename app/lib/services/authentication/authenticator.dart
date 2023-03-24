import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// pages
import 'package:app/pages/homepage.dart';
import 'package:app/pages/login.dart';

abstract class Auth {
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
