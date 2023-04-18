import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
  }

  ThemeData getTheme() {
    return (_darkMode) ? darkTheme : lightTheme;
  }

  SvgPicture getIcon() {
    return (_darkMode)
        ? SvgPicture.asset("assets/images/icons/COCO_Sun.svg", height: 40)
        : SvgPicture.asset("assets/images/icons/COCO_Moon.svg");
  }

  void switchTheme() async {
    _darkMode = !_darkMode;
    notifyListeners();

    await _prefs.then((SharedPreferences prefs) {
      prefs.setBool('Dark mode', _darkMode);
    });
  }
}
