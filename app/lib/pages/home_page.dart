import 'package:flutter/material.dart';

import '../services/authentication/google_authenticator.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(height: 100),
          const Text(
            'Home',
            style: const TextStyle(
              fontFamily: 'Jost',
              fontSize: 30,
            ),
          ),
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
        ],
      ),
    );
  }
}
