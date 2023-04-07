import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rest_house_rd/src/ui/routes/app_pages.dart';
import 'package:rest_house_rd/src/ui/routes/app_routes.dart';
import 'package:rest_house_rd/src/ui/theme/theme_changer.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final currentTheme = context.read<ThemeChanger>().currentTheme;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: currentTheme,
      title: 'Rent App',
      initialRoute: AppRoutes.home,
      routes: AppPages.pages,
    );
  }
}
