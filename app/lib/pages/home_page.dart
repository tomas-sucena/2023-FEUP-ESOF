import 'package:app/pages/event_form_page.dart';
import 'package:flutter/material.dart';

import '../components/interactive/event_card.dart';
import '../components/interactive/my_search_bar.dart';
import '../models/event.dart';
import '../models/volunteer.dart';
import '../utils/alignment.dart';

class HomePage extends StatelessWidget {
  final Volunteer _volunteer;

  /* CONSTRUCTOR */
  const HomePage({required Volunteer volunteer, Key? key})
      : _volunteer = volunteer,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => EventFormPage(volunteer: _volunteer),
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
          EventCard(
            event: MyEvent(
              name: "Save the turtles!",
              organizer: _volunteer,
              date: DateTime.now(),
              location: "Porto, Portugal",
              email: "projetotamar@gmail.com",
              phoneNumber: '(+351) 936 635 466',
              description:
                  "We are heading to the beach in order to help the baby turtles reach the sea.\n\nLet's save the turtles!",
            ),
          ),
        ],
      ),
    );
  }
}
