import 'package:flutter/material.dart';

import 'package:rest_house_rd/src/presentation/home/home_screen.dart';
import 'package:rest_house_rd/src/presentation/post/detail_preview_screen.dart';
import 'package:rest_house_rd/src/presentation/post/details_post_screen.dart';
import 'package:rest_house_rd/src/presentation/routes/app_routes.dart';
import 'package:rest_house_rd/src/presentation/auth/login.dart';

class AppPages {
  static Map<String, WidgetBuilder> pages = {
    AppRoutes.home: (_) => const HomeScreen(),
    AppRoutes.post: (_) => const DetailPostScreen(),
    AppRoutes.postView: (_) => const DetailPreviewScreen(),
    AppRoutes.login: (_) => const Login(),
  };
}
