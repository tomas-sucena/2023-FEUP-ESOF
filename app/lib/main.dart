import 'package:flutter/material.dart';

// pages
import 'package:app/pages/homepage.dart';
import 'package:app/pages/login.dart';

void main(){
  runApp(const CharityNet());
}

class CharityNet extends StatelessWidget {
  const CharityNet({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: 'Login',
      routes: {
        'Login': (context) => const LoginPage(),
        'Home' : (context) => const HomePage(),
      },
    );
  }
}
