import 'package:flutter/material.dart';

import '../models/user.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  //User _user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(height: 50),

          const Text(
            'Profile',
            style: const TextStyle(
              fontFamily: 'Jost',
              fontSize: 40,
              color: Color.fromRGBO(233, 161, 136, 1),
            ),
          ),

          Image.asset('assets/images/maintenance.png', height: 500),
        ],
      ),
    );
  }
}
