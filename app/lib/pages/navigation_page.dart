import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../models/volunteer.dart';
import '../services/data/database_manager.dart';
import 'home_page.dart';
import 'notifications_page.dart';
import 'profile_page.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({Key? key}) : super(key: key);

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int _currIndex;
  late Volunteer _volunteer;
  final DatabaseManager _dbManager;

  late final List<Widget> _pages = [
    HomePage(),
    NotificationsPage(),
    ProfilePage(_volunteer, _dbManager),
  ];

  /* CONSTRUCTOR */
  _NavigationPageState()
      : _currIndex = 0,
        _dbManager = DatabaseManager() {
    _volunteer = _fetchVolunteerData();
  }

  /* METHODS */
  void _changePage(int pageIndex) {
    setState(() {
      _currIndex = pageIndex;
    });
  }

  Volunteer _fetchVolunteerData() {
    var _user = FirebaseAuth.instance.currentUser;

    // fetch the data
    Volunteer? volunteer = _dbManager.getVolunteer(_user?.email);

    // create a new user
    if (volunteer == null) {
      volunteer = Volunteer.fromGoogle(_user);
      _dbManager.addVolunteer(volunteer);
    }

    return volunteer;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currIndex,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/images/icons/COCO_Home.svg'),
            activeIcon:
                SvgPicture.asset('assets/images/icons/COCO_Home_active.svg'),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon:
                SvgPicture.asset('assets/images/icons/COCO_Notifications.svg'),
            activeIcon: SvgPicture.asset(
                'assets/images/icons/COCO_Notifications_active.svg'),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/images/icons/COCO_Profile.svg'),
            activeIcon:
                SvgPicture.asset('assets/images/icons/COCO_Profile_active.svg'),
            label: 'Profile',
          ),
        ],
        onTap: _changePage,
        selectedFontSize: 16,
        unselectedFontSize: 14,
      ),
    );
  }
}
