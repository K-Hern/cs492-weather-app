import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weatherapp/themes/themes.dart' as theme;

class SettingsProvider extends ChangeNotifier {
  bool _darkMode = false;
  SharedPreferences? prefs;

  bool get darkMode => _darkMode;

  void toggleMode() {
    _darkMode = !_darkMode;
    if (prefs != null) {
      prefs!.setBool('darkMode', _darkMode);
    }

    notifyListeners();
  }

  SettingsProvider() {
    initPreferences();
  }

  void initPreferences() async {
    prefs = await SharedPreferences.getInstance();
    if (prefs != null) {
      _darkMode = prefs!.getBool('darkMode') ?? false;
    }
    notifyListeners();
  }

  void setThemeColor(Color newColor) {
    if (_darkMode) {
      theme.darkTheme = ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: newColor,
          brightness: Brightness.dark),
        useMaterial3: true,
      );
    } else {
    theme.lightTheme = ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: newColor,
          brightness: Brightness.light),
        useMaterial3: true,
      );
    }
    notifyListeners();
  }
}
