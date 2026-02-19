import 'package:shared_preferences/shared_preferences.dart';

class SpService{
  // to avoid confusion
  // true will be existing user
  // false will be new user
  Future<void> setUserStatus(bool userStatus) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('userStatus', userStatus);
  }

  Future<bool?> getUserStatus() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('userStatus');
  }
}