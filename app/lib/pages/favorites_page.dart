import 'package:flutter/material.dart';

import '../models/volunteer.dart';
import '../services/data/database_manager.dart';
import '../utils/alignment.dart';

class FavoritesPage extends StatefulWidget {
  final Volunteer _volunteer;
  final DatabaseManager _dbManager;

  /* CONSTRUCTOR */
  const FavoritesPage(
      {required Volunteer volunteer,
      required DatabaseManager dbManager,
      Key? key})
      : _volunteer = volunteer,
        _dbManager = dbManager,
        super(key: key);

  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            addVerticalSpace(40),
            Center(
              child: Text(
                'Favorites',
                style: TextStyle(
                  fontSize: 40,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            addVerticalSpace(10),

          ],
        ),
      ),
    );
  }
}
