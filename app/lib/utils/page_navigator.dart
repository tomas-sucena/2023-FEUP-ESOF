import 'package:flutter/material.dart';

class PageNavigator extends StatelessWidget {
  final Widget _page;
  final Key _key;
  final bool _isActive;

  /* CONSTRUCTOR */
  PageNavigator(
      {required Widget page, required Key key, required bool isActive})
      : _page = page,
        _key = key,
        _isActive = isActive;

  /* METHODS */
  @override
  Widget build(BuildContext context) {
    return Offstage(
      offstage: !_isActive,
      child: Navigator(
        key: _key,
        onGenerateRoute: (routeSettings) => MaterialPageRoute(
          builder: (context) => _page,
        ),
      ),
    );
  }
}
