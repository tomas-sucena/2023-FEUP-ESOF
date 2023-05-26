import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../models/charity_event.dart';
import '../../models/volunteer.dart';
import '../../services/data/database_manager.dart';
import 'event_card.dart';

class EventCardViewer extends StatelessWidget {
  final List<CharityEvent> _events;
  final Volunteer _volunteer;
  final DatabaseManager _dbManager;
  final Future<void> Function() _onRefresh;
  final bool _reverse;

  /* CONSTRUCTOR */
  const EventCardViewer(
      {required List<CharityEvent> events,
      required Volunteer volunteer,
      required DatabaseManager dbManager,
      required Future<void> Function() onRefresh,
      bool? reverse,
      Key? key})
      : _events = events,
        _volunteer = volunteer,
        _dbManager = dbManager,
        _onRefresh = onRefresh,
        _reverse = reverse ?? false,
        super(key: key);

  /* METHODS */
  @override
  Widget build(BuildContext context) {
    final int numEvents = _events.length;

    return RefreshIndicator(
      onRefresh: _onRefresh,
      color: Theme.of(context).primaryColor,
      child: ListView.separated(
        padding: EdgeInsets.zero,
        physics: AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
        itemCount: _events.length,
        itemBuilder: (_, index) => EventCard(
          event: _events[_reverse ? (numEvents - 1 - index) : index],
          volunteer: _volunteer,
          dbManager: _dbManager,
        ),
        separatorBuilder: (_, __) => const SizedBox(height: 10),
      ),
    );
  }
}
