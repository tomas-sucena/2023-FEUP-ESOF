import 'package:app/pages/event_form_page.dart';
import 'package:flutter/material.dart';

import '../components/interactive/event_card_viewer.dart';
import '../components/interactive/my_search_bar.dart';
import '../models/charity_event.dart';
import '../models/volunteer.dart';
import '../services/data/database_manager.dart';
import '../utils/alignment.dart';
import '../utils/icons/coco_icon.dart';
import 'loading_page.dart';

class HomePage extends StatefulWidget {
  final Volunteer _volunteer;
  final DatabaseManager _dbManager;

  /* CONSTRUCTOR */
  const HomePage({
    required Volunteer volunteer,
    required DatabaseManager dbManager,
    Key? key,
  })  : _volunteer = volunteer,
        _dbManager = dbManager,
        super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<CharityEvent>> _events;

  /* METHODS */
  Future<List<CharityEvent>> _fetchEvents() async {
    return widget._dbManager.getEvents();
  }

  Future<void> _refresh() async {
    final List<CharityEvent> newEvents = await _fetchEvents();

    setState(() {
      _events = Future.value(newEvents);
    });
  }

  Widget _buildPage(AsyncSnapshot snapshot) {
    return Scaffold(
      floatingActionButton: widget._volunteer.isOrganizer
          ? FloatingActionButton(
              backgroundColor: Theme.of(context).primaryColor,
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => EventFormPage(
                      organizer: widget._volunteer,
                      dbManager: widget._dbManager,
                    ),
                  ),
                );
              },
              child: COCOIcon(
                iconName: "Plus",
                height: 38,
                themeDependent: false,
              ),
            )
          : null,
      body: SingleChildScrollView(
        child: Column(
          children: [
            addVerticalSpace(48),
            Center(
              child: const MySearchBar(),
            ),
            addVerticalSpace(20),
            SizedBox(
              height: 650,
              width: 360,
              child: EventCardViewer(
                events: snapshot.data,
                volunteer: widget._volunteer,
                dbManager: widget._dbManager,
                onRefresh: _refresh,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _events = _fetchEvents();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _events,
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LoadingPage();

        return _buildPage(snapshot);
      },
    );
  }
}
