import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_builder.dart';

import '../../services/authentication/authenticator.dart';

class SignInButton extends StatelessWidget {
  final Authenticator _auth;

  // constructor
  SignInButton(this._auth);

  @override
  Widget build(BuildContext context) {
    return SignInButtonBuilder(
      text: "Sign in with Google",
      icon: Icons.email,
      fontSize: 18,
      onPressed: () {
        _auth.signIn();
      },
      backgroundColor: Colors.red.shade700,
    );
  }
}
