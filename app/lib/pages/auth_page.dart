import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../models/volunteer.dart';
import '../services/data/database_manager.dart';
import 'login_page.dart';
import 'navigation_page.dart';

class AuthPage extends StatelessWidget {
  final DatabaseManager _dbManager;

  /* CONSTRUCTOR */
  AuthPage({Key? key}) : _dbManager = DatabaseManager(), super(key: key);

  /* METHODS */
  Future<Volunteer> _fetchVolunteerData() async {
    var _user = FirebaseAuth.instance.currentUser;

    // fetch the data
    Volunteer? _volunteer = await _dbManager.getVolunteer(_user?.email);

    // create a new user
    if (_volunteer == null){
      _volunteer = Volunteer.fromGoogle(_user);
      await _dbManager.addVolunteer(_volunteer!);
    }

    return _volunteer;
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
            future: _fetchVolunteerData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState != ConnectionState.done)
                return const SizedBox.shrink();

              return NavigationPage(snapshot.data!, _dbManager);
            },
          );
        },
      ),
    );
  }
}
