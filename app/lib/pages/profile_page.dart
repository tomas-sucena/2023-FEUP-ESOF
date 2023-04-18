import 'package:app/components/alignment.dart';
import 'package:flutter/material.dart';

import '../components/passive/profile_card.dart';

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
      body: Column(
        children: [
          addVerticalSpace(50),
          Center(
            child: const Text(
              'Profile',
              style: const TextStyle(
                fontFamily: 'Jost',
                fontSize: 40,
                color: Color.fromRGBO(233, 161, 136, 1),
              ),
            ),
          ),
          addVerticalSpace(15),
          ProfileCard(),
        ],
      ),
    );
  }
}
