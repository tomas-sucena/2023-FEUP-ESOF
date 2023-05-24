import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../models/charity_event.dart';
import '../../services/data/database_manager.dart';
import 'event_card.dart';

class EventCardViewer extends StatelessWidget {
  final List<CharityEvent> _events;
  final DatabaseManager _dbManager;
  final Future<void> Function() _onRefresh;

  /* CONSTRUCTOR */
  const EventCardViewer(
      {required List<CharityEvent> events,
      required DatabaseManager dbManager,
      required Future<void> Function() onRefresh,
      Key? key})
      : _events = events,
        _dbManager = dbManager,
        _onRefresh = onRefresh,
        super(key: key);

  /* METHODS */
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _onRefresh,
      color: Theme.of(context).primaryColor,
      child: ListView.separated(
        padding: EdgeInsets.zero,
        physics: AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
        itemCount: _events.length,
        itemBuilder: (_, index) => EventCard(
          event: _events[index],
          dbManager: _dbManager,
        ),
        separatorBuilder: (_, __) => const SizedBox(height: 10),
      ),
    );
  }
}
