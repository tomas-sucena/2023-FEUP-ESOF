import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../services/data/database_manager.dart';
import 'login_page.dart';
import 'navigation_page.dart';

class AuthPage extends StatefulWidget {
  final DatabaseManager _dbManager;

  /* CONSTRUCTOR */
  AuthPage({Key? key})
      : _dbManager = DatabaseManager(),
        super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  /* METHODS */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // user is logged in
          if (snapshot.hasData)
            return NavigationPage(widget._dbManager);

          // user is NOT logged in
          return const LoginPage();
        },
      ),
    );
  }
}
