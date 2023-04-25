import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:rest_house_rd/src/presentation/app.dart';
import 'package:rest_house_rd/src/presentation/theme/theme_changer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent, // Navigation bar
      statusBarColor: Colors.transparent, // Status bar
    ),
  );

  return runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeChanger(1),
      child: const App(),
    ),
  );
}
