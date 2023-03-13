import 'package:app/pages/login.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(const CharityNet());
}

class CharityNet extends StatelessWidget {
  const CharityNet({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
