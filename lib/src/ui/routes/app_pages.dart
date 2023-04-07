import 'package:flutter/material.dart';

import 'package:rest_house_rd/src/ui/home/home_screen.dart';
import 'package:rest_house_rd/src/ui/post/detail_preview_screen.dart';
import 'package:rest_house_rd/src/ui/post/details_post_screen.dart';
import 'package:rest_house_rd/src/ui/routes/app_routes.dart';
import 'package:rest_house_rd/src/ui/user/login.dart';

class AppPages {
  static Map<String, WidgetBuilder> pages = {
    AppRoutes.home: (_) => const HomeScreen(),
    AppRoutes.post: (_) => const DetailPostScreen(),
    AppRoutes.postView: (_) => const DetailPreviewScreen(),
    AppRoutes.login : (_) => const Login(),
  };
}
