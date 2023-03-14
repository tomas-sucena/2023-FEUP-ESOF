import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
      gradient : LinearGradient(
          begin: Alignment(0,1),
          end: Alignment(-1,0),
          colors: [
            Color.fromRGBO(248, 240, 167, 1),
            Color.fromRGBO(232, 159, 135, 1)
          ]
        )
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
                  height: 150,
                  color: Color.fromRGBO(0, 0, 0, 125)
                ),
              ),

              // name
              const Text('CHARITY.NET',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 125),
                  fontFamily: 'Dokdo',
                  fontSize: 55,
                  letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                  fontWeight: FontWeight.normal,
                  height: 1
                ),
              ),

              const SizedBox(height: 20),

              // Google sign-in
              SignInButtonBuilder(
                text: "Sign in with Google",
                icon: Icons.email,
                fontSize: 18,
                onPressed: () {
                  Navigator.pushNamed(context, 'Home');
                },
                backgroundColor: Colors.red.shade700,
              )
            ],
          ),
        ),
      )
    );
  }
}
