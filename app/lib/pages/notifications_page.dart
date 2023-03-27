import 'package:flutter/material.dart';

import '../services/authentication/google_authenticator.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(height: 50),
          Image.asset('assets/images/maintenance.png', height: 500),
          Center(
            child: ElevatedButton(
              onPressed: () {
                GoogleAuthenticator()
                    .signOut(); // Navigate back to first screen when tapped.
              },
              child: const Text('Sign out'),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
