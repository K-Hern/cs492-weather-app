import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weatherapp/themes/themes.dart' as theme;

class SettingsProvider extends ChangeNotifier {
  bool _darkMode = false;
  int colorSeed = 0xffffff;
  SharedPreferences? prefs;

  bool get darkMode => _darkMode;
  
  SettingsProvider() {
    initPreferences();
  }

  void initPreferences() async {
    prefs = await SharedPreferences.getInstance();
    if (prefs != null) {
      _darkMode = prefs!.getBool('darkMode') ?? false;
      colorSeed = prefs!.getInt('colorSeed') ?? (colorSeed);
    }

    setThemeColor(Color(colorSeed));
    notifyListeners();
  }

  void toggleMode() {
    _darkMode = !_darkMode;
    if (prefs != null) {
      prefs!.setBool('darkMode', _darkMode);
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

    prefs?.setInt(('colorSeed'), newColor.value);
    notifyListeners();
  }
}
