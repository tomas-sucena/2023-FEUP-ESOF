import 'package:flutter/material.dart';

// pages
import 'package:app/pages/homepage.dart';
import 'package:app/pages/login.dart';

import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
