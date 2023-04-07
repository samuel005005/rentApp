import 'package:flutter/material.dart';
import 'package:rest_house_rd/src/ui/theme/colors.dart';

class ThemeChanger extends ChangeNotifier {
  bool _isDarkTheme = false;

  late ThemeData _currentTheme;

  ThemeChanger(int theme) {
    defaultTheme(theme);
  }

  bool get isDarkTheme => _isDarkTheme;

  ThemeData get currentTheme => _currentTheme;

  set isDarkTheme(bool value) {
    _isDarkTheme = value;
    if (value) {
      _currentTheme = darkTheme;
    } else {
      _currentTheme = customTheme;
    }
    notifyListeners();
  }

  void defaultTheme(int theme) {
    switch (theme) {
      case 1:
        _isDarkTheme = false;
        _currentTheme = customTheme;
        break;
      case 2:
        _isDarkTheme = true;
        _currentTheme = darkTheme;
        break;
      default:
        _isDarkTheme = false;
        _currentTheme = customTheme;
    }
  }

  static ThemeData get customTheme {
    return ThemeData(useMaterial3: true).copyWith(
      primaryColor: ColorsApp.primaryColor,
      colorScheme: const ColorScheme.light().copyWith(),
      scaffoldBackgroundColor: const Color(0xfff5f7f8),
      textButtonTheme: TextButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorsApp.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      iconTheme: IconThemeData(
        color: ColorsApp.primaryColor,
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData.dark(useMaterial3: true).copyWith(
      textButtonTheme: TextButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorsApp.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      textTheme: const TextTheme(),
    );
  }
}
