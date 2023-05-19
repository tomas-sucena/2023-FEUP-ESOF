import 'package:app/utils/icons/coco_icon.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../models/volunteer.dart';
import '../services/data/database_manager.dart';
import '../utils/page_navigator.dart';
import 'home_page.dart';
import 'notifications_page.dart';
import 'profile_page.dart';

class NavigationPage extends StatefulWidget {
  final DatabaseManager _dbManager;

  /* CONSTRUCTOR */
  const NavigationPage(DatabaseManager dbManager, {Key? key})
      : _dbManager = dbManager,
        super(key: key);

  /* METHOD */
  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  late final Future<Volunteer> _volunteer;
  late int _currPageIndex;
  final List<GlobalKey<NavigatorState>> _keys;

  /* CONSTRUCTOR */
  _NavigationPageState()
      : _keys = [
          GlobalKey<NavigatorState>(),
          GlobalKey<NavigatorState>(),
          GlobalKey<NavigatorState>(),
        ];

  /* METHODS */
  @override
  void initState() {
    super.initState();
    _currPageIndex = 0;
    _fetchVolunteerData();
  }

  Future<void> _fetchVolunteerData() async {
    final User? user = FirebaseAuth.instance.currentUser;
    if (user == null) throw Exception("The current user has no data!");

    final String email = user.email!;
    _volunteer = widget._dbManager.getVolunteer(email);
  }

  void _changePage(int pageIndex) {
    setState(() {
      _currPageIndex = pageIndex;
    });
  }

  Widget _buildLoadingScreen() {
    return const Center(
      child: const CircularProgressIndicator(
        color: const Color.fromRGBO(233, 161, 136, 1),
      ),
    );
  }

  Widget _buildNavigationBar(AsyncSnapshot snapshot) {
    return WillPopScope(
      onWillPop: () async =>
          !await _keys[_currPageIndex].currentState!.maybePop(),
      child: Scaffold(
        body: Stack(
          children: [
            PageNavigator(
              page: HomePage(),
              key: _keys[0],
              isActive: _currPageIndex == 0,
            ),
            PageNavigator(
              page: NotificationsPage(),
              key: _keys[1],
              isActive: _currPageIndex == 1,
            ),
            PageNavigator(
              page: ProfilePage(snapshot.data!, widget._dbManager),
              key: _keys[2],
              isActive: _currPageIndex == 2,
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currPageIndex,
          onTap: _changePage,
          items: [
            BottomNavigationBarItem(
              icon: COCOIcon(
                iconName: "Home",
                height: 38,
                themeDependent: false,
              ),
              activeIcon: COCOIcon(
                iconName: "Home_active",
                height: 38,
                themeDependent: false,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: COCOIcon(
                iconName: "Notifications",
                height: 38,
                themeDependent: false,
              ),
              activeIcon: COCOIcon(
                iconName: "Notifications_active",
                height: 38,
                themeDependent: false,
              ),
              label: 'Notifications',
            ),
            BottomNavigationBarItem(
              icon: COCOIcon(
                iconName: "Profile",
                height: 38,
                themeDependent: false,
              ),
              activeIcon: COCOIcon(
                iconName: "Profile_active",
                height: 38,
                themeDependent: false,
              ),
              label: 'Profile',
            ),
          ],
          selectedFontSize: 14,
          unselectedFontSize: 12,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Volunteer>(
      future: _volunteer,
      builder: (context, snapshot) {
        if (!snapshot.hasData) return _buildLoadingScreen();

        return _buildNavigationBar(snapshot);
      },
    );
  }
}
