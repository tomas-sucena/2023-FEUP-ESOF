import 'package:flutter/material.dart';

import '../components/interactive/profile_card.dart';
import '../models/volunteer.dart';
import '../services/data/database_manager.dart';
import '../utils/alignment.dart';

class ProfilePage extends StatefulWidget {
  final Volunteer _volunteer;
  final DatabaseManager _dbManager;

  /* CONSTRUCTOR */
  ProfilePage(Volunteer volunteer, DatabaseManager dbManager)
      : _volunteer = volunteer,
        _dbManager = dbManager;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          addVerticalSpace(40),
          Center(
            child: const Text(
              'Profile',
              style: const TextStyle(
                fontSize: 40,
                color: Color.fromRGBO(233, 161, 136, 1),
              ),
            ),
          ),
          addVerticalSpace(10),
          ProfileCard(widget._volunteer, widget._dbManager),
        ],
      ),
    );
  }
}
