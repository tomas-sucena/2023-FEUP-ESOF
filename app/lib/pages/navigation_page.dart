import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../models/volunteer.dart';
import '../services/data/database_manager.dart';
import 'home_page.dart';
import 'notifications_page.dart';
import 'profile_page.dart';

class NavigationPage extends StatefulWidget {
  final Volunteer _volunteer;
  final DatabaseManager _dbManager;

  /* CONSTRUCTOR */
  const NavigationPage(Volunteer volunteer, DatabaseManager dbManager,
      {Key? key})
      : _volunteer = volunteer,
        _dbManager = dbManager,
        super(key: key);

  /* METHOD */
  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  late int _currIndex;
  late final List<Widget> _pages;

  /* METHODS */
  @override
  void initState() {
    super.initState();

    _currIndex = 0;
    _pages = [
      HomePage(),
      NotificationsPage(),
      ProfilePage(widget._volunteer, widget._dbManager),
    ];
  }

  void _changePage(int pageIndex) {
    setState(() {
      _currIndex = pageIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currIndex,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/images/icons/COCO_Home.svg',
              height: 38,
            ),
            activeIcon: SvgPicture.asset(
              'assets/images/icons/COCO_Home_active.svg',
              height: 38,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/images/icons/COCO_Notifications.svg',
              height: 38,
            ),
            activeIcon: SvgPicture.asset(
              'assets/images/icons/COCO_Notifications_active.svg',
              height: 38,
            ),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/images/icons/COCO_Profile.svg',
              height: 38,
            ),
            activeIcon: SvgPicture.asset(
              'assets/images/icons/COCO_Profile_active.svg',
              height: 38,
            ),
            label: 'Profile',
          ),
        ],
        onTap: _changePage,
        selectedFontSize: 14,
        unselectedFontSize: 12,
      ),
    );
  }
}
