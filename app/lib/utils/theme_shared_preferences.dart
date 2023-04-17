import 'package:shared_preferences/shared_preferences.dart';

class ThemeSharedPreferences {
  static const PREF_KEY = 'theme_preference';

  setTheme(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(PREF_KEY, value);
  }

  getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(PREF_KEY) ?? false;
  }
}