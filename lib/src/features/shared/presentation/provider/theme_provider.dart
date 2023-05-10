import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rest_house_rd/src/config/theme/theme_changer.dart';

final themeProvider = ChangeNotifierProvider<ThemeChanger>((ref) {
  return ThemeChanger(0);
});
