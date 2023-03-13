import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: SafeArea(
        child: Column(
          children: [
            // logo
            Center(
              child: Icon(
                Icons.lock,
                size: 100
              ),
            ),

            // Google sign-in
          ],
        ),
      ),
    );
  }
}