import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rest_house_rd/src/ui/home/details_post_screen.dart';
import 'package:rest_house_rd/src/ui/home/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  return runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rent App',
      home: HomeScreen(),
    );
  }
}
