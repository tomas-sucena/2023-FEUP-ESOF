import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../components/interactive/sign_in_button.dart';
import '../services/authentication/google_authenticator.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _signInWithEmailAndPassword() async {
    final String email = _emailController.text.trim();
    final String password = _passwordController.text.trim();

    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      } catch (e) {
      print('Sign-in error: $e');
    }
  }

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

              const SizedBox(height: 20),

              // Email input
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                  ),
                ),
              ),

              const SizedBox(height: 10),

              // Password input
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Sign in button
              ElevatedButton(
                onPressed: _signInWithEmailAndPassword,
                child: Text('Sign In'),
              ),

              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
