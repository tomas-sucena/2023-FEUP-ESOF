import 'package:flutter/material.dart';

import '../components/interactive/event_card_viewer.dart';
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

  /* METHODS */
  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  /* METHODS */
  Future<void> _refresh() async {
    setState(() {});
  }

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
            addVerticalSpace(20),
            SizedBox(
              height: 650,
              width: 360,
              child: widget._volunteer.favoriteEvents.isNotEmpty
                  ? EventCardViewer(
                      events: widget._volunteer.favoriteEvents,
                      volunteer: widget._volunteer,
                      dbManager: widget._dbManager,
                      onRefresh: _refresh,
                      reverse: true,
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
                          child: Text(
                            "It seems there are no events...",
                            style: Theme.of(context).textTheme.displayMedium,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
