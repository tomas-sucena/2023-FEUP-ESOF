import 'package:flutter/material.dart';

import '../../models/charity_event.dart';
import '../../services/data/database_manager.dart';
import 'event_card.dart';

class EventCardViewer extends StatelessWidget {
  final List<CharityEvent> _events;
  final DatabaseManager _dbManager;

  /* CONSTRUCTOR */
  const EventCardViewer(
      {required List<CharityEvent> events,
      required DatabaseManager dbManager,
      Key? key})
      : _events = events,
        _dbManager = dbManager,
        super(key: key);

  /* METHODS */
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      itemCount: _events.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: EventCard(
          event: _events[index],
          dbManager: _dbManager,
        ),
      ),
    );
  }
}
