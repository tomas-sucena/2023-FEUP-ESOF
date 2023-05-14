import 'package:flutter/material.dart';

import '../utils/alignment.dart';

class EventPage extends StatelessWidget {
  const EventPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          addVerticalSpace(40),
          Center(
            child: const Text(
              'Event',
              style: const TextStyle(
                fontSize: 40,
                color: Color.fromRGBO(233, 161, 136, 1),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
