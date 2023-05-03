import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../models/volunteer.dart';
import '../services/data/database_manager.dart';
import 'login_page.dart';
import 'navigation_page.dart';

class AuthPage extends StatefulWidget {
  final DatabaseManager _dbManager;

  /* CONSTRUCTOR */
  AuthPage({Key? key}) : _dbManager = DatabaseManager(), super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  late final Future<Volunteer> _volunteer;

  /* METHODS */
  @override
  void initState() {
    super.initState();
    _volunteer = _fetchVolunteerData();
  }

  Future<Volunteer> _fetchVolunteerData() async {
    var _user = FirebaseAuth.instance.currentUser;

    // fetch the data
    return await widget._dbManager.getVolunteer(_user);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // user is NOT logged in
          if (!snapshot.hasData) return LoginPage();

          // user is logged in
          return FutureBuilder<Volunteer>(
            future: _volunteer,
            builder: (context, snapshot) {
              if (snapshot.connectionState != ConnectionState.done)
                return const SizedBox.shrink();

              return NavigationPage(snapshot.data!, widget._dbManager);
            },
          );
        },
      ),
    );
  }
}
