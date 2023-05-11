import 'package:flutter/material.dart';

import '../components/interactive/event_card.dart';
import '../components/interactive/search_bar.dart';
import '../utils/alignment.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin<HomePage> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

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
