import 'package:flutter/material.dart';
import 'package:rest_house_rd/src/config/theme/colors.dart';

class ThemeChanger extends ChangeNotifier {
  bool _isDarkTheme = false;

  late ThemeData _currentTheme;

  ThemeChanger(bool theme) {
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

  void defaultTheme(bool theme) {
    switch (theme) {
      case true:
        _isDarkTheme = true;
        _currentTheme = darkTheme;
        break;
      default:
        _isDarkTheme = false;
        _currentTheme = customTheme;
    }
  }

  static ThemeData get customTheme {
    return ThemeData(
      fontFamily: 'EncodeSansSemiCondensed',
      useMaterial3: true,
      canvasColor: const Color(0xfff5f6f8),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: Color(0xff646569),
        unselectedItemColor: Colors.grey,
      ),
      iconTheme: IconThemeData(
        color: Colors.grey.shade500,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          foregroundColor: ColorsApp.foregroundColor,
          textStyle: const TextStyle(fontWeight: FontWeight.bold),
          backgroundColor: const Color(0xffe4f6f8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: Color(0xffcbccce),
        unselectedItemColor: Colors.grey,
      ),
      iconTheme: IconThemeData(
        color: Colors.grey.shade500,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          foregroundColor: ColorsApp.foregroundColor,
          textStyle: const TextStyle(fontWeight: FontWeight.bold),
          backgroundColor: const Color(0xff192728),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }
}
