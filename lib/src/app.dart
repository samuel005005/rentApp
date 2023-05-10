import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rest_house_rd/src/features/shared/presentation/provider/theme_provider.dart';

import 'config/routes/app_router.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Rent App RD',
          routerConfig: appRouter,
          theme: ref.read(themeProvider).currentTheme),
    );
  }
}
