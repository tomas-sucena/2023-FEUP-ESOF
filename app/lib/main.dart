import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'pages/auth_page.dart';
import 'pages/home_page.dart';
import 'pages/login_page.dart';
import 'services/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const CharityNet());
}

class CharityNet extends StatelessWidget {
  const CharityNet({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: AuthPage(), debugShowCheckedModeBanner: false);
  }
}
