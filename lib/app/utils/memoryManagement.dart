import 'package:shared_preferences/shared_preferences.dart';

class MemoryManagement {
  static SharedPreferences? prefs;
  static Future<bool> init() async {
    prefs = await SharedPreferences.getInstance();
    return true;
  }

  static String? getAccessToken() {
    return prefs != null ? prefs!.getString('token') : null;
  }

  static void setAccessToken(String token) {
    prefs!.setString('token', token);
  }

  static void removeAccessToken() {
    prefs!.remove('token');
  }

  static String? getAccessRole() {
    return prefs != null ? prefs!.getString('role') : null;
  }

  static void setAccessRole(String token) {
    prefs!.setString('role', token);
  }

  static void removeAccessRole() {
    prefs!.remove('role');
  }

  static void removeAll() {
    prefs!.clear();
  }
}
