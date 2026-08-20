import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  static const _keyLoggedIn = 'is_logged_in';
  static const _keyUid = 'uid';

  Future<void> saveSession(String uid) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keyLoggedIn, true);
    await prefs.setString(_keyUid, uid);
  }

  Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_keyLoggedIn) ?? false;
  }

  Future<void> clearSession() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_keyLoggedIn);
    await prefs.remove(_keyUid);
  }
}