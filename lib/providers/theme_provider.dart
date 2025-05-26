import 'package:awesome_portfolio/consts/data.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.dark; // Initialize with dark theme

  ThemeMode get themeMode => _themeMode;

  void toggleTheme() {
    _themeMode =
        _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

  late BuildContext context;
  late Size size;
  late double heightRatio = size.height / baseHeight;
  late double widthRatio = size.width / baseWidth;
}
