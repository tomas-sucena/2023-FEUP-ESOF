import 'package:app/utils/icons/coco_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../models/volunteer.dart';
import '../services/data/database_manager.dart';
import '../utils/page_navigator.dart';
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
    _currIndex = 0;
  }

  void _changePage(int pageIndex) {
    setState(() {
      _currIndex = pageIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => !await _keys[_currIndex].currentState!.maybePop(),
      child: Scaffold(
        body: Stack(
          children: [
            PageNavigator(
              page: HomePage(),
              key: _keys[0],
              isActive: _currIndex == 0,
            ),
            PageNavigator(
              page: NotificationsPage(),
              key: _keys[1],
              isActive: _currIndex == 1,
            ),
            PageNavigator(
              page: ProfilePage(widget._volunteer, widget._dbManager),
              key: _keys[2],
              isActive: _currIndex == 2,
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currIndex,
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
}
