import 'package:flutter/material.dart';

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
                  height: 150),
              ),

              // name
              const Text('CHARITY.NET',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 1),
                  fontFamily: 'Dokdo',
                  fontSize: 55,
                  letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                  fontWeight: FontWeight.normal,
                  height: 1
                ),
              )

              // Google sign-in
            ],
          ),
        ),
      )
    );
  }
}
