import 'package:flutter/material.dart';
import 'package:rest_house_rd/src/ui/routes/app_pages.dart';
import 'package:rest_house_rd/src/ui/routes/app_routes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      title: 'Rent App',
      initialRoute: AppRoutes.home,
      routes: AppPages.pages,
    );
  }
}
