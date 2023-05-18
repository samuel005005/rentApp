import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeModelProvider extends ChangeNotifier {
  late AnimationController controller;

  bool _isVisible = false;

  bool get isVisible => _isVisible;
  set isVisible(bool value) {
    _isVisible = value;
    notifyListeners();
  }
}

final homeModelProvider = ChangeNotifierProvider<HomeModelProvider>((ref) {
  return HomeModelProvider();
});
