import 'package:flutter/material.dart';

import '../components/interactive/sign_in_button.dart';
import '../services/authentication/google_authenticator.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromRGBO(232, 159, 135, 1),
            Color.fromRGBO(248, 240, 167, 1),
          ]),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 180),

              // logo
              Center(
                child: Image.asset(
                  "assets/images/Logo.png",
                  height: 170,
                  color: Color.fromRGBO(0, 0, 0, 125),
                ),
              ),

              // name
              const Text(
                'CHARITY.NET',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 125),
                  fontFamily: 'Dokdo',
                  fontSize: 60,
                  letterSpacing: 0,
                  fontWeight: FontWeight.normal,
                  height: 1,
                ),
              ),

              const SizedBox(height: 20),

              // Google sign-in
              SignInButton(
                authenticator: GoogleAuthenticator(),
                logoFilename: "google_logo.png",
                name: "Google",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
