import 'package:flutter/gestures.dart';
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
    return ListView.separated(
      padding: EdgeInsets.zero,
      physics: AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
      itemCount: _events.length,
      itemBuilder: (_, index) => EventCard(
        event: _events[index],
        dbManager: _dbManager,
      ),
      separatorBuilder: (_, __) => const SizedBox(height: 10),
    );
  }
}
