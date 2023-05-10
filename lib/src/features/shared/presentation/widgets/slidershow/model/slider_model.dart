import 'package:flutter/material.dart';

class SliderModel extends ChangeNotifier {
  double _currentPage = 0;
  Color _primaryColor;
  Color _secundaryColor = Colors.grey;
  double _primaryBullet = 20;
  double _secundaryBullet = 12;

  SliderModel(
      this._primaryColor, _secundaryColor, _primaryBullet, _secundaryBullet);

  set currentPage(double currentPaage) {
    _currentPage = currentPaage;
    notifyListeners();
  }

  double get currentPage => _currentPage;

  set primaryColor(Color color) {
    _primaryColor = color;
    notifyListeners();
  }

  Color get primaryColor => _primaryColor;

  set secundaryColor(Color color) {
    _secundaryColor = color;
    notifyListeners();
  }

  Color get secundaryColor => _secundaryColor;

  set primaryBullet(double value) {
    _primaryBullet = value;
    notifyListeners();
  }

  double get primaryBullet => _primaryBullet;

  set secundaryBullet(double value) {
    _secundaryBullet = value;
    notifyListeners();
  }

  double get secundaryBullet => _secundaryBullet;
}
