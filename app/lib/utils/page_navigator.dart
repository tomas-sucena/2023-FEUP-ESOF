import 'package:flutter/material.dart';

class PageNavigator extends StatelessWidget {
  final Widget _page;
  final bool _isActive;
  final GlobalKey<NavigatorState> _navigatorKey;

  /* CONSTRUCTOR */
  PageNavigator({required Widget page, required bool isActive, Key? key})
      : _page = page,
        _isActive = isActive,
        _navigatorKey = GlobalKey<NavigatorState>(),
        super(key: key);

  /* METHODS */
  @override
  Widget build(BuildContext context) {
    return Offstage(
      offstage: !_isActive,
      child: Navigator(
        key: _navigatorKey,
        onGenerateRoute: (routeSettings) => MaterialPageRoute(
          builder: (context) => _page,
        ),
      ),
    );
  }
}
