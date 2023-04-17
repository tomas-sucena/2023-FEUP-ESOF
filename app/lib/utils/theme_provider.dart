import 'package:app/utils/theme_shared_preferences.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  late bool _isDark;
  late ThemeSharedPreferences _themeSharedPreferences;

  bool get isDark => _isDark;

  ThemeProvider() {
    _isDark = false;
    _themeSharedPreferences = ThemeSharedPreferences();
    getThemePreferences();
  }

  set darkMode(bool value) {
    _isDark = value;
    _themeSharedPreferences.setTheme(value);
    notifyListeners();
  }

  getThemePreferences() async {
    _isDark = await _themeSharedPreferences.getTheme();
    notifyListeners();
  }

  ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: const Color.fromRGBO(36, 38, 53, 1),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: const Color.fromRGBO(248, 234, 165, 1),
      selectedItemColor: const Color.fromRGBO(36, 38, 53, 1),
    ),
  );

  ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,

    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: const Color.fromRGBO(248, 234, 165, 1),
      selectedItemColor: const Color.fromRGBO(36, 38, 53, 1),
    ),

    // text settings
    fontFamily: 'Jost',
  );
}

