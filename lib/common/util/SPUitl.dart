import 'package:shared_preferences/shared_preferences.dart';

//SharedPreferences工具类
class SPUtil {
  static save(String key, value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (value is String) {
      prefs.setString(key, value);
    }
    if (value is int) {
      prefs.setInt(key, value);
    }
    if (value is bool) {
      prefs.setBool(key, value);
    }
  }

  static get(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.get(key);
  }

  static remove(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }
}
