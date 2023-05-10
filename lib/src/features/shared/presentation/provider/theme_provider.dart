import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rest_house_rd/src/config/theme/theme_changer.dart';

final themeProvider = ChangeNotifierProvider<ThemeChanger>((ref) {
  var brightness =
      SchedulerBinding.instance.platformDispatcher.platformBrightness;
  bool isDarkMode = brightness == Brightness.dark;
  return ThemeChanger(isDarkMode);
});
