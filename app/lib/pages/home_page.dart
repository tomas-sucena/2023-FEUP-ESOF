import 'package:app/pages/event_form_page.dart';
import 'package:flutter/material.dart';

import '../components/interactive/event_card.dart';
import '../components/interactive/my_search_bar.dart';
import 'loading_page.dart';
import '../models/charity_event.dart';
import '../models/volunteer.dart';
import '../services/data/database_manager.dart';
import '../utils/alignment.dart';

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
  Future<void> _fetchEvents() async {
    _events = widget._dbManager.getEvents();
  }

  Widget _buildHomePage(AsyncSnapshot snapshot) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
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
      ),
      body: Column(
        children: [
          addVerticalSpace(48),
          Center(
            child: const MySearchBar(),
          ),
          addVerticalSpace(20),
          SizedBox(
            width: 360,
            child: ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) => EventCard(
                event: snapshot.data[index],
                dbManager: widget._dbManager,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _fetchEvents();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _events,
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LoadingPage();

        return _buildHomePage(snapshot);
      }
    );
  }
}
