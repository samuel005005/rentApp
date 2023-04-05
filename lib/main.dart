import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rest_house_rd/src/ui/app.dart';

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

  return runApp(const App());
}
