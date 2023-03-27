import 'package:flutter/material.dart';

import 'home_page.dart';
import 'profile_page.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({Key? key}) : super(key: key);

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int _currIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    ProfilePage(),
  ];

  void _changePage(int pageIndex) {
    setState(() {
      _currIndex = pageIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currIndex,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        onDestinationSelected: _changePage,
        backgroundColor: Color.fromRGBO(248, 234, 165, 1),
      ),
    );
  }
}
