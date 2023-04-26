import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/passive/profile_card.dart';
import '../models/volunteer.dart';
import '../utils/alignment.dart';

class ProfilePage extends StatefulWidget {
  late final Volunteer _volunteer;

  /* CONSTRUCTOR */
  ProfilePage(Volunteer volunteer) : _volunteer = volunteer;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
                fontSize: 40,
                color: Color.fromRGBO(233, 161, 136, 1),
              ),
            ),
          ),
          addVerticalSpace(15),
          ProfileCard(widget._volunteer),
        ],
      ),
    );
  }
}
