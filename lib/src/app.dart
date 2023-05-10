import 'package:flutter/material.dart';

import 'config/routes/app_router.dart';
import 'config/theme/theme_changer.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Rent App RD',
        routerConfig: appRouter,
        // theme: context.read<ThemeChanger>().currentTheme,
      ),
    );
  }
}
