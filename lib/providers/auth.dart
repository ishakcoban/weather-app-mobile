import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Auth with ChangeNotifier {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<String?> getId() async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getString('userId');
  }

  Future<void> setId(String uId) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setString('userId', uId);
    notifyListeners();
  }
}
