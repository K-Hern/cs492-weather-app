import 'package:flutter/foundation.dart';

class SettingsProvider extends ChangeNotifier {
  bool _darkMode = false;

  bool get darkMode => _darkMode;
  
  void toggleMode(){
    _darkMode = !_darkMode;
    notifyListeners();
  }
}