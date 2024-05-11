import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static const String themeKey = 'themeKey';

  static late SharedPreferences _prefs;

  static Future<void> initialise() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static bool get isDark {
    return _prefs.getBool(themeKey) ?? false;
  }

  static set isDark(bool value) => _prefs.setBool(themeKey, value);
}
