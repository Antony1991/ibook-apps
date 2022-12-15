import 'package:shared_preferences/shared_preferences.dart';

/// 持久化存储
class LocalStorage {
  // final String TOKEN_KEY = 'ibook_token';

  static Future getString(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  static save(String key, value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  static remove(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }
}
