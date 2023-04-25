import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../models/volunteer.dart';
import 'home_page.dart';
import 'notifications_page.dart';
import 'profile_page.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({Key? key}) : super(key: key);

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  late int _currIndex;
  late Volunteer volunteer;

  final List<Widget> _pages = [
    HomePage(),
    NotificationsPage(),
    ProfilePage(),
  ];

  /* CONSTRUCTOR */
  _NavigationPageState() : _currIndex = 0 {
    volunteer = _fetchVolunteerData();
  }

  void _changePage(int pageIndex) {
    setState(() {
      _currIndex = pageIndex;
    });
  }

  Volunteer _fetchVolunteerData() {
    var _database = FirebaseFirestore.instance;
    var _user = FirebaseAuth.instance.currentUser;

    // fetch the data
    _database
        .collection("users")
        .doc(_user?.email)
        .get()
        .then((documentSnapshot) {
      if (documentSnapshot.exists) {
        return Volunteer.fromFirestore(documentSnapshot.data());
      }
    });

    // create a new user
    Volunteer volunteer = Volunteer.fromGoogle(_user);

    _database
        .collection("users")
        .doc(volunteer.email)
        .set(volunteer.toJSON())
        .onError((e, _) => print("Error adding a new user: $e"));

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
