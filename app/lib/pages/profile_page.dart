import 'package:flutter/material.dart';

import '../services/authentication/google_authenticator.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(height: 100),
          const Text('Profile',
              style: const TextStyle(
                fontFamily: 'Jost',
                fontSize: 30,
              )),
          Image.asset('assets/images/maintenance.png', height: 500),
        ],
      ),
    );
  }
}
