import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rest_house_rd/src/presentation/routes/app_pages.dart';
import 'package:rest_house_rd/src/presentation/routes/app_routes.dart';
import 'package:rest_house_rd/src/presentation/theme/theme_changer.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final currentTheme = context.read<ThemeChanger>().currentTheme;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: currentTheme,
        title: 'Rent App RD',
        initialRoute: AppRoutes.login,
        routes: AppPages.pages,
      ),
    );
  }
}
