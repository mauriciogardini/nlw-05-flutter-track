import 'package:flutter/material.dart';

class SettingsController extends ChangeNotifier {
  static SettingsController instance = SettingsController();

  bool isDarkTheme = false;
  changeTheme() {
    isDarkTheme = !isDarkTheme;
    notifyListeners();
  }
}
