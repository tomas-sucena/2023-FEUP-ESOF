import 'package:app/utils/icons/coco_icon.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'themes.dart';

class ThemeManager extends ChangeNotifier {
  final _prefs = SharedPreferences.getInstance();
  bool _darkMode = false;

  // constructor
  ThemeManager() {
    _restore();
  }

  void _restore() async {
    _darkMode = await _prefs.then((SharedPreferences prefs) {
      return prefs.getBool('Dark mode') ?? false;
    });

    if (_darkMode) notifyListeners();
  }

  ThemeData getTheme() {
    return (_darkMode) ? darkTheme : lightTheme;
  }

  COCOIcon getIcon() {
    return (_darkMode)
        ? COCOIcon(
            iconName: "Sun",
            height: 40,
            themeDependent: false,
          )
        : COCOIcon(
            iconName: "Moon",
            height: 40,
            themeDependent: false,
          );
  }

  void switchTheme() async {
    _darkMode = !_darkMode;
    notifyListeners();

    await _prefs.then((SharedPreferences prefs) {
      prefs.setBool('Dark mode', _darkMode);
    });
  }
}
