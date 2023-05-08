import 'package:flutter/material.dart';

import '../components/interactive/event_card.dart';
import '../components/interactive/search_bar.dart';
import '../utils/alignment.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          addVerticalSpace(48),
          Center(
            child: SearchBar(),
          ),
          addVerticalSpace(20),
          EventCard(),
        ],
      ),
    );
  }
}
